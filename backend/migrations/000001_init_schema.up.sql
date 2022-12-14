-- CREATE SCHEMA IF NOT EXISTS public;
CREATE TABLE IF NOT EXISTS "public.disease_type" (
    "id" BIGSERIAL PRIMARY KEY,
    "description" VARCHAR(140) NOT NULL
);

CREATE TABLE IF NOT EXISTS "public.country" (
    "cname" VARCHAR(50) PRIMARY KEY NOT NULL,
    "population" BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS "public.disease" (
    "id" BIGINT NOT NULL,
    "description" VARCHAR(140) NOT NULL,
    "disease_code" VARCHAR(50) UNIQUE NOT NULL,
    "pathogen" VARCHAR(20) NOT NULL,
    PRIMARY KEY ("disease_code"),
    FOREIGN KEY ("id") REFERENCES "public.disease_type" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "public.discover" (
    "cname" VARCHAR(50) NOT NULL,
    "disease_code" VARCHAR(50) NOT NULL,
    "first_enc_date" DATE NOT NULL,
    PRIMARY KEY ("cname", "disease_code"),
    FOREIGN KEY ("disease_code") REFERENCES "public.disease" ("disease_code") ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("cname") REFERENCES "public.country" ("cname") ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "public.users" (
    "email" VARCHAR(60) PRIMARY KEY NOT NULL,
    "name" VARCHAR(30) NOT NULL,
    "surname" VARCHAR(40) NOT NULL,
    "salary" INT NOT NULL,
    "phone" VARCHAR(20) NOT NULL,
    "cname" VARCHAR(50) NOT NULL,
    FOREIGN KEY ("cname") REFERENCES "public.country" ("cname") ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "public.public_servant" (
    "email" VARCHAR(60) PRIMARY KEY NOT NULL,
    "department" VARCHAR(50) NOT NULL,
    FOREIGN KEY ("email") REFERENCES "public.users" ("email") ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "public.doctor" (
    "email" VARCHAR(60) PRIMARY KEY NOT NULL,
    "degree" VARCHAR(20) NOT NULL,
    FOREIGN KEY ("email") REFERENCES "public.users" ("email") ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "public.specialize" (
    "id" BIGINT NOT NULL,
    "email" VARCHAR(60) NOT NULL,
    PRIMARY KEY ("id", "email"),
    FOREIGN KEY ("id") REFERENCES "public.disease_type" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("email") REFERENCES "public.doctor" ("email") ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "public.record" (
    "email" VARCHAR(60) NOT NULL,
    "cname" VARCHAR(50) NOT NULL,
    "disease_code" VARCHAR(50) NOT NULL,
    "total_deaths" BIGINT NOT NULL,
    "total_patients" BIGINT NOT NULL,
    PRIMARY KEY ("email", "cname", "disease_code"),
    FOREIGN KEY ("email") REFERENCES "public.public_servant" ("email") ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("cname") REFERENCES "public.country" ("cname") ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("disease_code") REFERENCES "public.disease" ("disease_code") ON UPDATE CASCADE ON DELETE CASCADE
);

