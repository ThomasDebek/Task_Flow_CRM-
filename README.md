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
• ✅ Ruby on Rails
• ✅ PostgreSQL database
• ✅ PgSearch with PostgreSQL full-text search
• ✅ MVC architecture
• ✅ Strong parameters in controller
• ✅ Reusable partials (_form)
• ✅ View helpers (status_badge)
• ✅ Clean and structured controllers
• ✅ Devise Authentication
• ✅ User ownership authorization
• ✅ RSpec testing framework
• ✅ FactoryBot test factories
• ✅ Shoulda Matchers

⸻

📂 Project Structure
•	✅ ClientsController – full CRUD logic
•	✅ LeadsController – full CRUD + conversion
•	✅ Client model – validations and data structure
•	✅ Lead model – validations and helper methods
•   ✅ SearchesController – global CRM search
•   ✅ User model – authentication and ownership



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


### Multi-User CRM
- ✅ Clients belong to users
- ✅ Leads belong to users
- ✅ Users can access only their own data
- ✅ Secure ownership-based resource access
- ✅ Protected nested resources (tasks and notes)


### Authentication & User Management
- ✅ User authentication with Devise
- ✅ User registration
- ✅ User login and logout
- ✅ Password reset functionality
- ✅ Account management
- ✅ Tailwind CSS styled Devise views


### Pagination
- ✅ Kaminari pagination
- ✅ Paginated clients list
- ✅ Paginated leads list
- ✅ Custom Tailwind styled pagination

### Testing (RSpec)
- ✅ RSpec configured for Rails 8
- ✅ FactoryBot configured
- ✅ Shoulda Matchers configured
- ✅ Client model specs:
  - Validations
  - Associations
  - Dependent destroy behavior
- ✅ Lead model specs:
  - Validations
  - Associations
  - Custom methods: full_name, next_status, can_advance?
- ✅ Task model specs:
  - Validations
  - Associations
  - Status scopes
- ✅ Note model specs:
  - Validation
  - Associations
- ✅ Clients request specs:
  - Authenticated access
  - Unauthenticated redirects
  - Create client
  - Assign client to current user
  - Show own client
  - Prevent access to other users' clients
  - Update own client
  - Prevent updating other users' clients
  - Delete own client
  - Prevent deleting other users' clients
- ✅ Leads request specs:
  - Authenticated access
  - Unauthenticated redirects
  - Create lead
  - Assign lead to current user
  - Show own lead
  - Prevent access to other users' leads
  - Update own lead
  - Prevent updating other users' leads
  - Delete own lead
  - Prevent deleting other users' leads
  - Convert lead into client
- ✅ Notes request specs:
  - Create note
  - Delete note
  - Prevent access to other users' notes
- ✅ Tasks request specs:
  - Create task
  - Update task
  - Delete task
  - Prevent access to other users' tasks

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
- Implementing authentication with Devise
- Working with user ownership and authorization
- Restricting resources to authenticated users
- Styling Devise views with Tailwind CSS
- Building a multi-user CRM architecture
- Add new pagination used kaminari 
- Setting up RSpec in a Rails application
- Creating factories with FactoryBot
- Testing model validations
- Testing Active Record associations
- Testing dependent destroy callbacks
- Testing custom model methods
- Using Shoulda Matchers for cleaner specs
- Writing request specs for authenticated Rails controllers
- Testing Devise-protected routes
- Testing multi-user data ownership in request specs
- Testing create, show, update and destroy actions
- Testing nested resources in Rails
- Testing request specs for Notes and Tasks
- Testing ownership-based authorization for nested resources
- Testing CRUD actions through request specs



🔜 Next Steps

• ⏳ Lead Advance Request Specs
• ⏳ Search Request Specs
• ⏳ Dashboard Request Specs
• ⏳ Service Objects
• ⏳ Decorators / Presenters
• ⏳ Background Jobs (Sidekiq)
• ⏳ Hotwire / Turbo Streams


