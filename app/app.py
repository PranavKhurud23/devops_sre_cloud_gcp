import streamlit as st
import sqlite3
import pandas as pd
from datetime import datetime

# THIS MUST BE THE FIRST STREAMLIT COMMAND:
st.set_page_config(page_title="Expense Tracker", page_icon="💰", layout="wide")



# Initialize SQLite DB
def init_db():
    conn = sqlite3.connect('expenses.db')
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS expenses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount REAL NOT NULL,
            category TEXT NOT NULL,
            note TEXT,
            date TEXT NOT NULL
        )
    ''')
    conn.commit()
    conn.close()

init_db()

# Page Setup
#st.set_page_config(page_title="Expense Tracker", page_icon="💰", layout="centered")
st.title("💰 Expense Tracker")

# Database Query for Total
conn = sqlite3.connect('expenses.db')
cursor = conn.cursor()
cursor.execute('SELECT SUM(amount) FROM expenses')
total = cursor.fetchone()[0] or 0.0

st.metric(label="Total Spent", value=f"₹{total:,.2f}")
st.divider()

# Input Form
with st.form("expense_form", clear_on_submit=True):
    st.subheader("Add New Expense")
    amount = st.number_input("Amount (₹)", min_value=1.0, step=10.0)
    category = st.selectbox("Category", ["🛒 Groceries", "⛽ Fuel", "💡 Bills", "📦 Other"])
    note = st.text_input("Note (Optional)", placeholder="e.g. Milk & Bread")
    submitted = st.form_submit_button("Add Expense", type="primary")

    if submitted:
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        cursor.execute('INSERT INTO expenses (amount, category, note, date) VALUES (?, ?, ?, ?)',
                       (amount, category, note, date))
        conn.commit()
        st.success(f"Added ₹{amount} for {category}!")
        st.rerun()

# Display Recent Transactions
st.subheader("Recent Transactions")
df = pd.read_sql_query("SELECT id, amount, category, note, date FROM expenses ORDER BY id DESC LIMIT 10", conn)
conn.close()

if not df.empty:
    st.dataframe(df, use_container_width=True, hide_index=True)
else:
    st.info("No expenses logged yet.")