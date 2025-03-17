create extension if not exists "moddatetime" with schema "extensions";


create type "public"."book_user_status" as enum ('読んだ', '読みたい');

create table "public"."badge_user" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "badge_id" uuid not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."badges" (
    "id" uuid not null default gen_random_uuid(),
    "name" text not null,
    "description" text not null,
    "image_path" text not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."book_ranking" (
    "id" uuid not null default gen_random_uuid(),
    "book_id" uuid not null,
    "rank" smallint not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."book_user" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "book_id" uuid not null,
    "status" book_user_status not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."books" (
    "id" uuid not null default gen_random_uuid(),
    "isbm" text not null,
    "title" text not null,
    "description" text not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."comments" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "post_id" uuid not null,
    "content" text not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."favorites" (
    "id" uuid not null default gen_random_uuid(),
    "post_id" uuid not null,
    "user_id" uuid not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."followers" (
    "id" uuid not null default gen_random_uuid(),
    "follower_id" uuid not null,
    "following_id" uuid not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."posts" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "title" text not null,
    "content" text not null,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


create table "public"."user_ranking" (
    "id" uuid not null default gen_random_uuid(),
    "user_id" uuid not null,
    "rank" smallint not null,
    "created_at" timestamp with time zone not null,
    "updated_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text)
);


CREATE UNIQUE INDEX badge_user_pkey ON public.badge_user USING btree (id);

CREATE UNIQUE INDEX badges_pkey ON public.badges USING btree (id);

CREATE UNIQUE INDEX book_ranking_pkey ON public.book_ranking USING btree (id);

CREATE UNIQUE INDEX book_user_pkey ON public.book_user USING btree (id);

CREATE UNIQUE INDEX books_pkey ON public.books USING btree (id);

CREATE UNIQUE INDEX comments_pkey ON public.comments USING btree (id);

CREATE UNIQUE INDEX favorites_pkey ON public.favorites USING btree (id);

CREATE UNIQUE INDEX followers_pkey ON public.followers USING btree (id);

CREATE UNIQUE INDEX posts_pkey ON public.posts USING btree (id);

CREATE UNIQUE INDEX user_ranking_pkey ON public.user_ranking USING btree (id);

alter table "public"."badge_user" add constraint "badge_user_pkey" PRIMARY KEY using index "badge_user_pkey";

alter table "public"."badges" add constraint "badges_pkey" PRIMARY KEY using index "badges_pkey";

alter table "public"."book_ranking" add constraint "book_ranking_pkey" PRIMARY KEY using index "book_ranking_pkey";

alter table "public"."book_user" add constraint "book_user_pkey" PRIMARY KEY using index "book_user_pkey";

alter table "public"."books" add constraint "books_pkey" PRIMARY KEY using index "books_pkey";

alter table "public"."comments" add constraint "comments_pkey" PRIMARY KEY using index "comments_pkey";

alter table "public"."favorites" add constraint "favorites_pkey" PRIMARY KEY using index "favorites_pkey";

alter table "public"."followers" add constraint "followers_pkey" PRIMARY KEY using index "followers_pkey";

alter table "public"."posts" add constraint "posts_pkey" PRIMARY KEY using index "posts_pkey";

alter table "public"."user_ranking" add constraint "user_ranking_pkey" PRIMARY KEY using index "user_ranking_pkey";

alter table "public"."badge_user" add constraint "badge_user_badge_id_fkey" FOREIGN KEY (badge_id) REFERENCES badges(id) not valid;

alter table "public"."badge_user" validate constraint "badge_user_badge_id_fkey";

alter table "public"."badge_user" add constraint "badge_user_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."badge_user" validate constraint "badge_user_user_id_fkey";

alter table "public"."book_ranking" add constraint "book_ranking_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(id) not valid;

alter table "public"."book_ranking" validate constraint "book_ranking_book_id_fkey";

alter table "public"."book_user" add constraint "book_user_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(id) not valid;

alter table "public"."book_user" validate constraint "book_user_book_id_fkey";

alter table "public"."book_user" add constraint "book_user_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."book_user" validate constraint "book_user_user_id_fkey";

alter table "public"."comments" add constraint "comments_post_id_fkey" FOREIGN KEY (post_id) REFERENCES posts(id) not valid;

alter table "public"."comments" validate constraint "comments_post_id_fkey";

alter table "public"."comments" add constraint "comments_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."comments" validate constraint "comments_user_id_fkey";

alter table "public"."favorites" add constraint "favorites_post_id_fkey" FOREIGN KEY (post_id) REFERENCES posts(id) not valid;

alter table "public"."favorites" validate constraint "favorites_post_id_fkey";

alter table "public"."favorites" add constraint "favorites_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."favorites" validate constraint "favorites_user_id_fkey";

alter table "public"."followers" add constraint "followers_follower_id_fkey" FOREIGN KEY (follower_id) REFERENCES auth.users(id) not valid;

alter table "public"."followers" validate constraint "followers_follower_id_fkey";

alter table "public"."followers" add constraint "followers_following_id_fkey" FOREIGN KEY (following_id) REFERENCES auth.users(id) not valid;

alter table "public"."followers" validate constraint "followers_following_id_fkey";

alter table "public"."posts" add constraint "posts_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."posts" validate constraint "posts_user_id_fkey";

alter table "public"."user_ranking" add constraint "user_ranking_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."user_ranking" validate constraint "user_ranking_user_id_fkey";

grant delete on table "public"."badge_user" to "anon";

grant insert on table "public"."badge_user" to "anon";

grant references on table "public"."badge_user" to "anon";

grant select on table "public"."badge_user" to "anon";

grant trigger on table "public"."badge_user" to "anon";

grant truncate on table "public"."badge_user" to "anon";

grant update on table "public"."badge_user" to "anon";

grant delete on table "public"."badge_user" to "authenticated";

grant insert on table "public"."badge_user" to "authenticated";

grant references on table "public"."badge_user" to "authenticated";

grant select on table "public"."badge_user" to "authenticated";

grant trigger on table "public"."badge_user" to "authenticated";

grant truncate on table "public"."badge_user" to "authenticated";

grant update on table "public"."badge_user" to "authenticated";

grant delete on table "public"."badge_user" to "service_role";

grant insert on table "public"."badge_user" to "service_role";

grant references on table "public"."badge_user" to "service_role";

grant select on table "public"."badge_user" to "service_role";

grant trigger on table "public"."badge_user" to "service_role";

grant truncate on table "public"."badge_user" to "service_role";

grant update on table "public"."badge_user" to "service_role";

grant delete on table "public"."badges" to "anon";

grant insert on table "public"."badges" to "anon";

grant references on table "public"."badges" to "anon";

grant select on table "public"."badges" to "anon";

grant trigger on table "public"."badges" to "anon";

grant truncate on table "public"."badges" to "anon";

grant update on table "public"."badges" to "anon";

grant delete on table "public"."badges" to "authenticated";

grant insert on table "public"."badges" to "authenticated";

grant references on table "public"."badges" to "authenticated";

grant select on table "public"."badges" to "authenticated";

grant trigger on table "public"."badges" to "authenticated";

grant truncate on table "public"."badges" to "authenticated";

grant update on table "public"."badges" to "authenticated";

grant delete on table "public"."badges" to "service_role";

grant insert on table "public"."badges" to "service_role";

grant references on table "public"."badges" to "service_role";

grant select on table "public"."badges" to "service_role";

grant trigger on table "public"."badges" to "service_role";

grant truncate on table "public"."badges" to "service_role";

grant update on table "public"."badges" to "service_role";

grant delete on table "public"."book_ranking" to "anon";

grant insert on table "public"."book_ranking" to "anon";

grant references on table "public"."book_ranking" to "anon";

grant select on table "public"."book_ranking" to "anon";

grant trigger on table "public"."book_ranking" to "anon";

grant truncate on table "public"."book_ranking" to "anon";

grant update on table "public"."book_ranking" to "anon";

grant delete on table "public"."book_ranking" to "authenticated";

grant insert on table "public"."book_ranking" to "authenticated";

grant references on table "public"."book_ranking" to "authenticated";

grant select on table "public"."book_ranking" to "authenticated";

grant trigger on table "public"."book_ranking" to "authenticated";

grant truncate on table "public"."book_ranking" to "authenticated";

grant update on table "public"."book_ranking" to "authenticated";

grant delete on table "public"."book_ranking" to "service_role";

grant insert on table "public"."book_ranking" to "service_role";

grant references on table "public"."book_ranking" to "service_role";

grant select on table "public"."book_ranking" to "service_role";

grant trigger on table "public"."book_ranking" to "service_role";

grant truncate on table "public"."book_ranking" to "service_role";

grant update on table "public"."book_ranking" to "service_role";

grant delete on table "public"."book_user" to "anon";

grant insert on table "public"."book_user" to "anon";

grant references on table "public"."book_user" to "anon";

grant select on table "public"."book_user" to "anon";

grant trigger on table "public"."book_user" to "anon";

grant truncate on table "public"."book_user" to "anon";

grant update on table "public"."book_user" to "anon";

grant delete on table "public"."book_user" to "authenticated";

grant insert on table "public"."book_user" to "authenticated";

grant references on table "public"."book_user" to "authenticated";

grant select on table "public"."book_user" to "authenticated";

grant trigger on table "public"."book_user" to "authenticated";

grant truncate on table "public"."book_user" to "authenticated";

grant update on table "public"."book_user" to "authenticated";

grant delete on table "public"."book_user" to "service_role";

grant insert on table "public"."book_user" to "service_role";

grant references on table "public"."book_user" to "service_role";

grant select on table "public"."book_user" to "service_role";

grant trigger on table "public"."book_user" to "service_role";

grant truncate on table "public"."book_user" to "service_role";

grant update on table "public"."book_user" to "service_role";

grant delete on table "public"."books" to "anon";

grant insert on table "public"."books" to "anon";

grant references on table "public"."books" to "anon";

grant select on table "public"."books" to "anon";

grant trigger on table "public"."books" to "anon";

grant truncate on table "public"."books" to "anon";

grant update on table "public"."books" to "anon";

grant delete on table "public"."books" to "authenticated";

grant insert on table "public"."books" to "authenticated";

grant references on table "public"."books" to "authenticated";

grant select on table "public"."books" to "authenticated";

grant trigger on table "public"."books" to "authenticated";

grant truncate on table "public"."books" to "authenticated";

grant update on table "public"."books" to "authenticated";

grant delete on table "public"."books" to "service_role";

grant insert on table "public"."books" to "service_role";

grant references on table "public"."books" to "service_role";

grant select on table "public"."books" to "service_role";

grant trigger on table "public"."books" to "service_role";

grant truncate on table "public"."books" to "service_role";

grant update on table "public"."books" to "service_role";

grant delete on table "public"."comments" to "anon";

grant insert on table "public"."comments" to "anon";

grant references on table "public"."comments" to "anon";

grant select on table "public"."comments" to "anon";

grant trigger on table "public"."comments" to "anon";

grant truncate on table "public"."comments" to "anon";

grant update on table "public"."comments" to "anon";

grant delete on table "public"."comments" to "authenticated";

grant insert on table "public"."comments" to "authenticated";

grant references on table "public"."comments" to "authenticated";

grant select on table "public"."comments" to "authenticated";

grant trigger on table "public"."comments" to "authenticated";

grant truncate on table "public"."comments" to "authenticated";

grant update on table "public"."comments" to "authenticated";

grant delete on table "public"."comments" to "service_role";

grant insert on table "public"."comments" to "service_role";

grant references on table "public"."comments" to "service_role";

grant select on table "public"."comments" to "service_role";

grant trigger on table "public"."comments" to "service_role";

grant truncate on table "public"."comments" to "service_role";

grant update on table "public"."comments" to "service_role";

grant delete on table "public"."favorites" to "anon";

grant insert on table "public"."favorites" to "anon";

grant references on table "public"."favorites" to "anon";

grant select on table "public"."favorites" to "anon";

grant trigger on table "public"."favorites" to "anon";

grant truncate on table "public"."favorites" to "anon";

grant update on table "public"."favorites" to "anon";

grant delete on table "public"."favorites" to "authenticated";

grant insert on table "public"."favorites" to "authenticated";

grant references on table "public"."favorites" to "authenticated";

grant select on table "public"."favorites" to "authenticated";

grant trigger on table "public"."favorites" to "authenticated";

grant truncate on table "public"."favorites" to "authenticated";

grant update on table "public"."favorites" to "authenticated";

grant delete on table "public"."favorites" to "service_role";

grant insert on table "public"."favorites" to "service_role";

grant references on table "public"."favorites" to "service_role";

grant select on table "public"."favorites" to "service_role";

grant trigger on table "public"."favorites" to "service_role";

grant truncate on table "public"."favorites" to "service_role";

grant update on table "public"."favorites" to "service_role";

grant delete on table "public"."followers" to "anon";

grant insert on table "public"."followers" to "anon";

grant references on table "public"."followers" to "anon";

grant select on table "public"."followers" to "anon";

grant trigger on table "public"."followers" to "anon";

grant truncate on table "public"."followers" to "anon";

grant update on table "public"."followers" to "anon";

grant delete on table "public"."followers" to "authenticated";

grant insert on table "public"."followers" to "authenticated";

grant references on table "public"."followers" to "authenticated";

grant select on table "public"."followers" to "authenticated";

grant trigger on table "public"."followers" to "authenticated";

grant truncate on table "public"."followers" to "authenticated";

grant update on table "public"."followers" to "authenticated";

grant delete on table "public"."followers" to "service_role";

grant insert on table "public"."followers" to "service_role";

grant references on table "public"."followers" to "service_role";

grant select on table "public"."followers" to "service_role";

grant trigger on table "public"."followers" to "service_role";

grant truncate on table "public"."followers" to "service_role";

grant update on table "public"."followers" to "service_role";

grant delete on table "public"."posts" to "anon";

grant insert on table "public"."posts" to "anon";

grant references on table "public"."posts" to "anon";

grant select on table "public"."posts" to "anon";

grant trigger on table "public"."posts" to "anon";

grant truncate on table "public"."posts" to "anon";

grant update on table "public"."posts" to "anon";

grant delete on table "public"."posts" to "authenticated";

grant insert on table "public"."posts" to "authenticated";

grant references on table "public"."posts" to "authenticated";

grant select on table "public"."posts" to "authenticated";

grant trigger on table "public"."posts" to "authenticated";

grant truncate on table "public"."posts" to "authenticated";

grant update on table "public"."posts" to "authenticated";

grant delete on table "public"."posts" to "service_role";

grant insert on table "public"."posts" to "service_role";

grant references on table "public"."posts" to "service_role";

grant select on table "public"."posts" to "service_role";

grant trigger on table "public"."posts" to "service_role";

grant truncate on table "public"."posts" to "service_role";

grant update on table "public"."posts" to "service_role";

grant delete on table "public"."user_ranking" to "anon";

grant insert on table "public"."user_ranking" to "anon";

grant references on table "public"."user_ranking" to "anon";

grant select on table "public"."user_ranking" to "anon";

grant trigger on table "public"."user_ranking" to "anon";

grant truncate on table "public"."user_ranking" to "anon";

grant update on table "public"."user_ranking" to "anon";

grant delete on table "public"."user_ranking" to "authenticated";

grant insert on table "public"."user_ranking" to "authenticated";

grant references on table "public"."user_ranking" to "authenticated";

grant select on table "public"."user_ranking" to "authenticated";

grant trigger on table "public"."user_ranking" to "authenticated";

grant truncate on table "public"."user_ranking" to "authenticated";

grant update on table "public"."user_ranking" to "authenticated";

grant delete on table "public"."user_ranking" to "service_role";

grant insert on table "public"."user_ranking" to "service_role";

grant references on table "public"."user_ranking" to "service_role";

grant select on table "public"."user_ranking" to "service_role";

grant trigger on table "public"."user_ranking" to "service_role";

grant truncate on table "public"."user_ranking" to "service_role";

grant update on table "public"."user_ranking" to "service_role";

CREATE TRIGGER handle_badge_user_updated_at BEFORE UPDATE ON public.badge_user FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_badges_updated_at BEFORE UPDATE ON public.badges FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_book_ranking_updated_at BEFORE UPDATE ON public.book_ranking FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_book_user_updated_at BEFORE UPDATE ON public.book_user FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_books_updated_at BEFORE UPDATE ON public.books FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_comments_updated_at BEFORE UPDATE ON public.comments FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_favorites_updated_at BEFORE UPDATE ON public.favorites FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_followers_updated_at BEFORE UPDATE ON public.followers FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_posts_updated_at BEFORE UPDATE ON public.posts FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_user_ranking_updated_at BEFORE UPDATE ON public.user_ranking FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');


