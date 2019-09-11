# Rails Rest API

## Project Setup

**Install all gems**:

```console
$ bundle install
```

**Update the database with new data model**:

```console
$ rails db:migrate
```

**Feed the database with default seeds**:

```console
$ rails db:seeds
```

**Start the web server on `http://localhost:3000` by default**:

```console
$ rails server
```

**Run tests (work in progress)**:

```console
$ rails test
```

## Usage

| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| GET | /users    | List all users for projects|
| POST | /users | Add a new user |
| PUT | /users/:id | Update user info |
| UPDATE | /users/:id | Update user info (same as put) |
| DELETE | /users/:id | Remove user |
| GET | /user/:token | Get user with given token |
| POST | /auth/login | Login and get token |
| GET | /customers    | List all customers|
| POST | /customers | Add a new customer |
| PUT | /customers/:id | Update customer info |
| UPDATE | /customers/:id | Update customer info (same as put) |
| DELETE | /customers/:id | Remove customer |
| GET | /user/:token | Get user with given token |
| GET | /projects    | List all projects|
| POST | /projects | Add a new project |
| PUT | /projects/:id | Update project info |
| UPDATE | /projects/:id | Update project info (same as put) |
| DELETE | /projects/:id | Remove project |
| GET | /modulus    | List all modules|
| POST | /modulus | Add a new module |
| PUT | /modulu/:id | Update module info |
| UPDATE | /modulu/:id | Update module info (same as put) |
| DELETE | /modulu/:id | Remove module |
| GET | /tasks    | List all tasks|
| POST | /tasks | Add a new task |
| PUT | /tasks/:id | Update task info |
| UPDATE | /tasks/:id | Update task info (same as put) |
| DELETE | /tasks/:id | Remove task |
| GET | /roles    | List all roles|
| POST | /roles | Add a new role |
| PUT | /roles/:id | Update role info |
| UPDATE | /roles/:id | Update role info (same as put) |
| DELETE | /roles/:id | Remove role |
| GET | /work_items    | List all work items|
| POST | /work_items | Add a new work item |
| PUT | /work_items/:id | Update work item info |
| UPDATE | /work_items/:id | Update work item info (same as put) |
| DELETE | /work_items/:id | Remove work item |
## Use Case Examples (Work in progress)