import mysql.connector
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import os

# CONNECT PYTHON TO MYSQL:
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="hotel_revenue_db"
)

print("MySQL connection successful!")

# LOAD SQL VIEW INTO PANDAS:
query = """
SELECT *
FROM hotel_analysis;
"""
df = pd.read_sql(query, connection)
print(df.head())

# EXPLORE DATA:
print(df.shape)

print(df.info())

print(df.describe())

print(df.isnull().sum())

print(
    "Duplicates:",
    df.duplicated().sum()
)

# CONVERT DATES:
date_columns = [
    "check_in",
    "check_out"
]

for column in date_columns:
    df[column] = pd.to_datetime(
        df[column]
    )

# CREATE DATA COLUMNS:
df["year"] = df["check_in"].dt.year

df["month"] = df["check_in"].dt.month

df["month_name"] = (
    df["check_in"].dt.month_name()
)

df["weekday"] = (
    df["check_in"].dt.day_name()
)

# CREATE COMPLETE DATASET:
completed_df = df[
    df["booking_status"] == "Completed"
].copy()

# KPI ANALYSIS:
total_bookings = len(df)

completed_bookings = len(
    completed_df
)

cancelled_bookings = len(
    df[
        df["booking_status"] == "Cancelled"
    ]
)

total_revenue = completed_df[
    "revenue"
].sum()

average_booking_value = completed_df[
    "revenue"
].mean()

average_stay = completed_df[
    "stay_days"
].mean()

cancellation_rate = (
    cancelled_bookings /
    total_bookings
) * 100

average_rating = completed_df[
    "rating"
].mean()

print("Total Bookings:", total_bookings)
print("Completed:", completed_bookings)
print("Cancelled:", cancelled_bookings)
print("Revenue:", total_revenue)
print(
    "Average Booking Value:",
    average_booking_value
)
print(
    "Average Stay:",
    average_stay
)
print(
    "Cancellation Rate:",
    cancellation_rate
)
print(
    "Average Rating:",
    average_rating
)

# Visualizations
# 1.Revenue by Room Type:
data = (
    completed_df
    .groupby("room_type")["revenue"]
    .sum()
    .sort_values(ascending=False)
)
plt.figure(figsize=(9,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title("Revenue by Room Type")
plt.xlabel("Room Type")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig(
    "../Images/01_revenue_by_room_type.png",
    dpi=300
)
plt.show()

# 2.Monthly Revenue:
data = (
    completed_df
    .groupby(
        ["month","month_name"]
    )["revenue"]
    .sum()
    .reset_index()
    .sort_values("month")
)
plt.figure(figsize=(10,6))
sns.lineplot(
    data=data,
    x="month_name",
    y="revenue",
    marker="o"
)

plt.title("Monthly Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")

plt.tight_layout()

plt.savefig(
    "../Images/02_monthly_revenue.png",
    dpi=300
)

plt.show()

# 3. Booking by Roomtype:
data = (
    completed_df["room_type"]
    .value_counts()
)
plt.figure(figsize=(9,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title("Bookings by Room Type")
plt.xlabel("Room Type")
plt.ylabel("Bookings")
plt.tight_layout()
plt.savefig(
    "../Images/03_bookings_by_room_type.png",
    dpi=300
)
plt.show()

# 4.Revenue by Booking Channel:
data = (
    completed_df
    .groupby("booking_channel")["revenue"]
    .sum()
    .sort_values(ascending=False)
)
plt.figure(figsize=(9,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title("Revenue by Booking Channel")
plt.xlabel("Booking Channel")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig(
    "../Images/04_revenue_by_channel.png",
    dpi=300
)
plt.show()

# 5.Customer Type Vs Revenue:
data = (
    completed_df
    .groupby("customer_type")["revenue"]
    .sum()
)
plt.figure(figsize=(8,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title("Revenue by Customer Type")
plt.xlabel("Customer Type")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig(
    "../Images/05_customer_type_revenue.png",
    dpi=300
)
plt.show()

# 6.Booking Status:
data = df["booking_status"].value_counts()
plt.figure(figsize=(7,7))
plt.pie(
    data.values,
    labels=data.index,
    autopct="%1.1f%%",
    startangle=90
)
plt.title("Booking Status Distribution")
plt.savefig(
    "../Images/06_booking_status.png",
    dpi=300
)
plt.show()

# 7.Payment methods:
data = (
    completed_df["payment_method"]
    .value_counts()
)
plt.figure(figsize=(8,8))
plt.pie(
    data.values,
    labels=data.index,
    autopct="%1.1f%%",
    startangle=90
)
plt.title("Payment Method Distribution")
plt.savefig(
    "../Images/07_payment_methods.png",
    dpi=300
)
plt.show()

# 8.Top 10 Customers:
data = (
    completed_df
    .groupby("customer_name")["revenue"]
    .sum()
    .sort_values()
    .tail(10)
)
plt.figure(figsize=(10,7))
sns.barplot(
    x=data.values,
    y=data.index
)
plt.title(
    "Top 10 Customers by Revenue"
)
plt.xlabel("Revenue")
plt.ylabel("Customer")
plt.tight_layout()
plt.savefig(
    "../Images/08_top_customers.png",
    dpi=300
)
plt.show()

# 9.Average Stay by Roomtype:
data = (
    completed_df
    .groupby("room_type")["stay_days"]
    .mean()
)
plt.figure(figsize=(9,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title(
    "Average Stay Duration by Room Type"
)
plt.xlabel("Room Type")
plt.ylabel("Average Stay Days")
plt.tight_layout()
plt.savefig(
    "../Images/09_average_stay_room.png",
    dpi=300
)
plt.show()

# 10.Monthly Booking Trend:
data = (
    completed_df
    .groupby(
        ["month","month_name"]
    )
    .size()
    .reset_index(
        name="bookings"
    )
    .sort_values("month")
)
plt.figure(figsize=(10,6))
sns.lineplot(
    data=data,
    x="month_name",
    y="bookings",
    marker="o"
)
plt.title("Monthly Booking Trend")
plt.xlabel("Month")
plt.ylabel("Bookings")
plt.tight_layout()
plt.savefig(
    "../Images/10_monthly_bookings.png",
    dpi=300
)
plt.show()

# 11.Cancellation Rate by Channel:
data = (
    df
    .groupby("booking_channel")
    .apply(
        lambda x:
        (x["booking_status"] == "Cancelled")
        .mean() * 100,
        include_groups=False
    )
)
plt.figure(figsize=(9,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title(
    "Cancellation Rate by Booking Channel"
)
plt.xlabel("Booking Channel")
plt.ylabel("Cancellation Rate (%)")
plt.tight_layout()
plt.savefig(
    "../Images/11_cancellation_by_channel.png",
    dpi=300
)
plt.show()

# 12.Rating Distribution:
data = completed_df["rating"]
plt.figure(figsize=(9,6))
sns.histplot(
    data,
    bins=5,
    discrete=True
)
plt.title("Customer Rating Distribution")
plt.xlabel("Rating")
plt.ylabel("Number of Reviews")
plt.tight_layout()
plt.savefig(
    "../Images/12_rating_distribution.png",
    dpi=300
)
plt.show()

# 13.Room Price vs Revenue:
data = (
    completed_df
    .groupby(
        ["room_type","price_per_night"]
    )["revenue"]
    .sum()
    .reset_index()
)
plt.figure(figsize=(9,6))
sns.scatterplot(
    data=data,
    x="price_per_night",
    y="revenue",
    hue="room_type",
    s=150
)
plt.title(
    "Room Price vs Total Revenue"
)
plt.xlabel("Price per Night")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig(
    "../Images/13_room_price_vs_revenue.png",
    dpi=300
)
plt.show()

# 14.Stay Duration vs Revenue:
plt.figure(figsize=(9,6))
sns.scatterplot(
    data=completed_df,
    x="stay_days",
    y="revenue",
    hue="room_type",
    s=100
)
plt.title(
    "Stay Duration vs Booking Revenue"
)
plt.xlabel("Stay Duration (Days)")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig(
    "../Images/14_stay_vs_revenue.png",
    dpi=300
)
plt.show()

# 15.Revenue by City:
data = (
    completed_df
    .groupby("city")["revenue"]
    .sum()
    .sort_values(ascending=False)
)
plt.figure(figsize=(10,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title("Revenue by Customer City")
plt.xlabel("City")
plt.ylabel("Revenue")
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig(
    "../Images/15_revenue_by_city.png",
    dpi=300
)
plt.show()

# 16.Average Rating by Roomtype:
data = (
    completed_df
    .groupby("room_type")["rating"]
    .mean()
)
plt.figure(figsize=(9,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title(
    "Average Rating by Room Type"
)
plt.xlabel("Room Type")
plt.ylabel("Average Rating")
plt.tight_layout()
plt.savefig(
    "../Images/16_rating_by_room_type.png",
    dpi=300
)
plt.show()

# 17.Guest Category:
guest_category = pd.cut(
    completed_df["guests"],
    bins=[0,1,2,3,10],
    labels=[
        "Single",
        "Couple",
        "Small Group",
        "Large Group"
    ]
)

data = guest_category.value_counts()
plt.figure(figsize=(8,6))
sns.barplot(
    x=data.index,
    y=data.values
)
plt.title("Bookings by Guest Category")
plt.xlabel("Guest Category")
plt.ylabel("Bookings")
plt.tight_layout()
plt.savefig(
    "../Images/17_guest_category.png",
    dpi=300
)
plt.show()

# 18.Revenue Distribution:
plt.figure(figsize=(9,6))
sns.histplot(
    completed_df["revenue"],
    bins=10,
    kde=True
)
plt.title("Booking Revenue Distribution")
plt.xlabel("Revenue")
plt.ylabel("Frequency")
plt.tight_layout()
plt.savefig(
    "../Images/18_revenue_distribution.png",
    dpi=300
)
plt.show()

# 19.Age vs Revenue:
plt.figure(figsize=(9,6))
sns.scatterplot(
    data=completed_df,
    x="age",
    y="revenue",
    hue="customer_type",
    s=100
)
plt.title(
    "Customer Age vs Booking Revenue"
)
plt.xlabel("Customer Age")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig(
    "../Images/19_age_vs_revenue.png",
    dpi=300
)
plt.show()

# 20.Rating vs Revenue:
plt.figure(figsize=(9,6))
sns.boxplot(
    data=completed_df,
    x="rating",
    y="revenue"
)
plt.title(
    "Customer Rating vs Booking Revenue"
)
plt.xlabel("Rating")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig(
    "../Images/20_rating_vs_revenue.png",
    dpi=300
)
plt.show()

df.to_csv(
    "../Dataset/hotel_analysis.csv",
    index=False
)

completed_df.to_csv(
    "../Dataset/completed_bookings.csv",
    index=False
)

room_summary = (
    completed_df
    .groupby("room_type")
    .agg(
        bookings=("booking_id","count"),
        revenue=("revenue","sum"),
        average_rating=("rating","mean"),
        average_stay=("stay_days","mean")
    )
    .reset_index()
)

room_summary.to_csv(
    "../Dataset/room_summary.csv",
    index=False
)

customer_summary = (
    completed_df
    .groupby(
        [
            "customer_id",
            "customer_name",
            "city",
            "customer_type"
        ]
    )
    .agg(
        bookings=("booking_id","count"),
        revenue=("revenue","sum"),
        average_rating=("rating","mean")
    )
    .reset_index()
    .sort_values(
        "revenue",
        ascending=False
    )
)

customer_summary.to_csv(
    "../Dataset/customer_summary.csv",
    index=False
)

# Final KPI Dashboard Output:
print("\n")
print("=" * 55)
print("HOTEL REVENUE & CUSTOMER ANALYTICS")
print("=" * 55)

print(
    f"Total Bookings       : {total_bookings}"
)

print(
    f"Completed Bookings   : {completed_bookings}"
)

print(
    f"Cancelled Bookings   : {cancelled_bookings}"
)

print(
    f"Total Revenue        : ₹{total_revenue:,.2f}"
)

print(
    f"Average Booking      : ₹{average_booking_value:,.2f}"
)

print(
    f"Average Stay         : {average_stay:.2f} days"
)

print(
    f"Cancellation Rate    : {cancellation_rate:.2f}%"
)

print(
    f"Average Rating       : {average_rating:.2f}/5"
)

print("=" * 55)

connection.close()

print("MySQL connection closed.")