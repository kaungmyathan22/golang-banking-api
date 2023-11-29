.PHONY: createdb dropdb migrateup migratedown
DB_URL=postgresql://admin:admin@localhost:5432/bankdb?sslmode=disable

createdb:
	docker exec -it go-bank-app-postgres createdb --username=admin --owner=admin bankdb

dropdb:
	docker exec -it go-bank-app-postgres dropdb --username=admin bankdb

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migrateup1:
	migrate -path db/migration -database "$(DB_URL)" -verbose up 1

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

migratedown1:
	migrate -path db/migration -database "$(DB_URL)" -verbose down 1

new_migration:
	migrate create -ext sql -dir db/migration -seq $(name)
