import { MongoClient } from "mongodb";

const MONGO_URI = process.env.MONGO_URI || "mongodb://127.0.0.1/kd-portal";

export const mongo = new MongoClient(MONGO_URI, {
  connectTimeoutMS: 1000,
  serverSelectionTimeoutMS: 1000,
});
