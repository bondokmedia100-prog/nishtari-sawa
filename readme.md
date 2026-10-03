# Nishtari Sawa

Private starter repository for the Egyptian Arabic group-buying app.

The complete Expo mobile app and Node/PostGIS server source is packaged in `nishtari-sawa-project.zip`. Render builds the API from that source bundle using the root `Dockerfile` and `render.yaml`.

## Render setup

This free web service requires `DATABASE_URL` from a Supabase PostgreSQL project. Do not commit database credentials. The health endpoint checks PostgreSQL, so the service will not become healthy until that secret is configured.

The mobile app code and local development instructions are in the zip archive.
