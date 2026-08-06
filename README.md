# Th1nk

Th1nk simplifies extracting and visualizing data from messy Excel files.

---

## Prerequisites

- **[Docker](https://docs.docker.com/engine/install/)** and **[Docker Compose](https://docs.docker.com/compose/install/)** installed
- At least **2 GB of RAM** available

---

## Quick Start

### 1. Clone the repository

```console
$ git clone -b th1nk-ce --single-branch https://github.com/uol-esis/Th1nk.git th1nk-ce
$ cd th1nk-ce
```

### 2. Create your environment file

Create a `.env` file in the project root and fill in the following values:

```bash
# Ports (used by the application and optionally by a reverse proxy)
HTTP_PORT=3000
API_PORT=3801
METABASE_PORT=3002
KEYCLOAK_PORT=8003

# Public hostnames (used by the reverse proxy / TLS setup)
API_HOST=api.example.com
METABASE_HOST=dashboard.example.com
KEYCLOAK_HOST=auth.example.com

# Database passwords (generate securely, e.g. with openssl rand -hex 32)
METABASE_DB_PASSWORD=
BACKEND_DB_PASSWORD=
KEYCLOAK_DB_PASSWORD=

# Keycloak admin credentials
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=<password>

# Set after initial Metabase setup (see step 4)
MB_API_KEY=<api_key>
MB_GENERAL_KEY=<key>
```

You can generate secure passwords with:

```console
$ openssl rand -hex 32
```

### 3. Start the infrastructure services

Start Keycloak, Metabase, and their databases first:

```console
$ docker compose up -d th1-db keycloak-db keycloak metabase-db metabase
```

> [!NOTE]
> You may see warnings like `"MB_API_KEY" variable is not set`. These are expected at this stage and can be ignored.

> [!TIP]
> Before proceeding, make **Keycloak** (`KEYCLOAK_PORT`) and **Metabase** (`METABASE_PORT`) accessible via a reverse proxy (e.g. nginx or Traefik) with a valid TLS certificate under `KEYCLOAK_HOST` and `METABASE_HOST`.

### 4. Configure Metabase

1. Open Metabase in your browser (`http://localhost:METABASE_PORT` or via your reverse proxy).
2. Complete the initial setup and create an admin account. **Save your password.**
3. When prompted to connect a database, use the following settings:
   - **Type:** PostgreSQL
   - **Host:** `th1-db`
   - **Port:** `5432`
   - **Database name:** `backend`
   - **Username:** `backend`
   - **Password:** value of `$BACKEND_DB_PASSWORD` from your `.env`
   - **Schemas:** select all except `th1-internal`
   - **SSL:** disabled
4. Generate an API key:
   - Go to **Admin Settings → Authentication → API Keys → Create new**
   - Name: `key`, Role: **Administrator**
   - Copy both the **API key** and the **General key**.
5. Add the keys to your `.env`:

```console
$ echo "MB_API_KEY=<your-api-key>" >> .env
$ echo "MB_GENERAL_KEY=<your-general-key>" >> .env
```

### 5. Start the full stack

```console
$ docker compose up -d
```

> [!TIP]
> Make the frontend (`HTTP_PORT`) accessible via your reverse proxy as well.
> For nginx, add the following to your server block to support large file uploads:
> ```nginx
> large_client_header_buffers 4 32k;
> client_max_body_size 200M;
> ```

### 6. Configure Keycloak

1. Open Keycloak in your browser and log in to the **master** realm using `KEYCLOAK_ADMIN` and `KEYCLOAK_ADMIN_PASSWORD`.
2. Switch to the **th1nk** realm.
3. Navigate to **Clients → th1ink** and update the following fields, then save:
   - **Root URL:** `https://example.com/`
   - **Home URL:** `https://example.com/`
   - **Valid redirect URIs:** `https://example.com/*`
4. Navigate to **Clients → th1ink → Roles** and ensure all roles except `visitor` and `user` are assigned as needed.

#### Adding users

**Data supplier:**
1. Go in keycloak to **Users → Add user** in the th1nk realm.
2. After creating the user, open their **Role mapping** tab and assign the **admin** role.

**Data consumer:**
1. Go in metabase to **Admin Settings → People → Invite user**.

---

## Additional Configuration

### Localization

In Metabase, go to **Admin Settings → Localization** to adjust language, date formats, and number formats.

### Map tiles

Th1nk uses OpenStreetMap tiles by default. You can configure the tile provider URL in the admin settings:

```
https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png
```

For custom or self-hosted tile providers, please contact us.
