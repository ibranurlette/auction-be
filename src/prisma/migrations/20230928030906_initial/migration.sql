-- CreateEnum
CREATE TYPE "StatusProducts" AS ENUM ('Ongoing', 'Completed');

-- CreateEnum
CREATE TYPE "StatusParticipants" AS ENUM ('Win', 'Lose', 'Undecided');

-- CreateTable
CREATE TABLE "participants" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "status" "StatusParticipants" NOT NULL DEFAULT 'Undecided',
    "price" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "participants_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "status" "StatusProducts" NOT NULL DEFAULT 'Ongoing',
    "description" TEXT NOT NULL,
    "owner" INTEGER NOT NULL,
    "participant" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "participants" ADD CONSTRAINT "participants_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_owner_fkey" FOREIGN KEY ("owner") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_participant_fkey" FOREIGN KEY ("participant") REFERENCES "participants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
