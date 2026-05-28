# README

TaskFlow CRM

TaskFlow CRM is a Ruby on Rails application for managing clients, leads, and tasks in a clean and structured way.

This project is being built step by step to demonstrate real-world Rails development practices.

⸻
🚀 Current Features

Clients Management (CRUD)
•	✅ Create, view, edit, and delete clients
•	✅ Store basic client information:
•	Name
•	Email
•	Phone
•	Company name
•	Status

⸻

Leads Management
•	✅ Create, view, edit, and delete leads
•	✅ Store lead information:
•	First name
•	Last name
•	Email
•	Phone
•	Company name
•	Status

⸻

🔁 Lead Conversion
•	✅ Convert lead into client
•	✅ Automatically creates a new client from lead data
•	✅ Removes lead after conversion


Lead Pipeline

* ✅ Lead statuses: new, contacted, qualified, lost
* ✅ Controlled lead progression through pipeline stages
* ✅ Reusable helper-based status badges for leads

⸻

🎨 UI (Tailwind CSS)
•	✅ Responsive layout
•	✅ Navigation bar
•	✅ Styled forms and cards
•	✅ Flash messages (success / error)
•	✅ Clean dashboard-style UI

⸻

🧠 Status System

Clients have a status:
•	Active
•	Inactive
•	VIP
•	✅ Status displayed using reusable helper-based badges

⸻

⚙️ Technical Implementation
•	✅ Ruby on Rails
•	✅ PostgreSQL database
•   ✅ PgSearch with PostgreSQL full-text search
•	✅ MVC architecture
•	✅ Strong parameters in controller
•	✅ Reusable partials (_form)
•	✅ View helpers (status_badge)
•	✅ Clean and structured controllers

⸻

📂 Project Structure
•	✅ ClientsController – full CRUD logic
•	✅ LeadsController – full CRUD + conversion
•	✅ Client model – validations and data structure
•	✅ Lead model – validations and helper methods
•   ✅ SearchesController – global CRM search



### Tasks Management
- ✅ Create, edit, and delete tasks for clients
- ✅ Assign tasks directly to a specific client
- ✅ Store task details:
    - Title
    - Description
    - Status
    - Due date
- ✅ Display client tasks on the client details page
- ✅ Filter client tasks by status and overdue date
- ✅ Improved task cards UI with status badges


### Dashboard
- ✅ Overview of clients, leads, and tasks
- ✅ Display key CRM statistics
- ✅ Highlight pending and overdue tasks
- ✅ Clickable dashboard cards for quick navigation


### Seed Data
- ✅ Realistic sample data using Faker
- ✅ Randomized clients, leads, and tasks
- ✅ Overdue and future tasks for testing dashboard


### Search System
- ✅ Client search using PgSearch
- ✅ Search by name
- ✅ Search by email
- ✅ Search by phone number
- ✅ Search by company name
- ✅ Global search bar in navigation

### Global Search System
- ✅ Global CRM search using PgSearch
- ✅ Search clients and leads from the navigation bar
- ✅ PostgreSQL full-text search
- ✅ Search by name
- ✅ Search by email
- ✅ Search by phone number
- ✅ Search by company name
- ✅ Dedicated global search results page
- ✅ Reusable search partial in navbar

⸻
## 🧪 What I Learned

- Building a full CRUD system without scaffolding
- Structuring Rails controllers and views
- Using partials to avoid duplication
- Debugging view issues (duplicate rendering)
- Working with strong params and schema consistency
- Creating reusable UI helpers
- Implementing business logic (lead → client conversion)
- Building a simple lead pipeline with controlled status progression
- Working with nested resources and associations in Rails
- Implementing PostgreSQL search using PgSearch
- Building reusable search functionality
- Using PostgreSQL full-text search with PgSearch 
- Creating reusable search partials
⸻

🔜 Next Steps

•	⏳ Notes system
•	⏳ Authentication (Devise)
•	⏳ Pagination

