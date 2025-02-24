import { MongoClient } from "mongodb";
import assert from "node:assert";

const uri = process.env.MONGO_URI;
assert(uri);

export const mongo = new MongoClient(uri);
