import fs from "node:fs";

/**
 * @template T
 * @typedef {T | undefined | void | null} Maybe
 */

const jsonValidations = {
  /**
   * @template {boolean} T
   * @param {unknown} data
   * @param {T} [maybe=false]
   * @returns {data is T extends false ? Record<keyof any, any> : Maybe<Record<keyof any, any>>}
   */
  object(data, maybe = /**@type {T}*/ (false)) {
    if (maybe && typeof data === "undefined") return true;
    if (typeof data !== "object") return false;
    if (data === null) return false;
    if (Array.isArray(data)) return false;
    return true;
  },
  /**
   * @template {boolean} T
   * @param {unknown} data
   * @param {T} [maybe=false]
   * @returns {data is T extends false ? string : Maybe<string>}
   */
  string(data, maybe = /**@type {T}*/ (false)) {
    if (maybe && typeof data === "undefined") return true;
    return typeof data === "string";
  },
  /**
   * @template {boolean} T
   * @param {unknown} data
   * @param {T} [maybe=false]
   * @returns {data is T extends false ? number : Maybe<number>}
   */
  number(data, maybe = /**@type {T}*/ (false)) {
    if (maybe && typeof data === "undefined") return true;
    return typeof data === "number";
  },
  /**
   * @template {boolean} T
   * @param {unknown} data
   * @param {T} [maybe=false]
   * @returns {data is T extends false ? boolean : Maybe<boolean>}
   */
  boolean(data, maybe = /**@type {T}*/ (false)) {
    if (maybe && typeof data === "undefined") return true;
    return typeof data === "boolean";
  },
  /**
   * @template {boolean} T
   * @param {unknown} data
   * @param {T} [maybe=false]
   * @returns {data is T extends false ? any[] : Maybe<any[]>}
   */
  array(data, maybe = /**@type {T}*/ (false)) {
    if (maybe && typeof data === "undefined") return true;
    return Array.isArray(data);
  },
};

/**
 * @template T
 * @abstract
 * @property {T} data @readonly @abstract
 */
class VerifiedJson {
  /**
   * @param {string} file
   */
  constructor(file) {
    try {
      this.data = this.jsonRead(file);
    } catch {
      console.error(`Failed to read JSON file: ${file}`);
      process.exit(1);
    }
    if (!this.verify(this.data)) {
      console.error(`Invalid JSON file: ${file}`);
      process.exit(1);
    }
  }
  /**
   * @param {string} file
   * @protected
   */
  jsonRead(file) {
    return JSON.parse(fs.readFileSync(file, "utf-8"));
  }

  /**
   * @param {string} file
   * @param {any} data
   * @protected
   */
  jsonWrite(file, data) {
    return fs.writeFileSync(file, JSON.stringify(data), "utf-8");
  }

  /**
   * Ensures that the data is of the correct type.
   * @param {unknown} data
   * @returns {data is T}
   * @abstract
   * @protected
   */
  verify(data) {
    return false;
  }
}

/**
 * @typedef {{
 *  engines?: {
 *    node?: string;
 *    pnpm?: string;
 *  };
 * }} PackageJson
 */

/**
 * @extends {VerifiedJson<PackageJson>}
 */
class LocalPackageJson extends VerifiedJson {
  constructor() {
    super("package.json");
  }
  /**
   * @override
   * @param {unknown} data
   * @returns {data is PackageJson}
   * @protected
   */
  verify(data) {
    return (
      jsonValidations.object(data) &&
      jsonValidations.object(data["engines"], true) &&
      jsonValidations.string(data["engines"]["node"], true) &&
      jsonValidations.string(data["engines"]["pnpm"], true)
    );
  }
}

let literal = false;

function grabKeychain(obj, keychain) {
  let current = obj.data;
  for (const key of keychain) {
    if (current === undefined) return undefined;
    current = current[key];
  }
  if (literal) console.log(current.replace(/\n/, "\\n").replace(/"/, '\\"'));
  else console.log(current);
  process.exit(0);
}

/**
 * @param {string} subcommand
 * @param {string} keychain
 * @param {string} filepath
 */
function read(subcommand, keychain, filepath) {
  switch (subcommand) {
    case "localpackagejson":
      grabKeychain(new LocalPackageJson(), keychain.split("."));
      break;
    default:
      console.error(`Unknown read command: ${subcommand}`);
      process.exit(1);
  }
}

/**
 * @param {string} subcommand
 * @param {string} keychain
 * @param {string} value
 * @param {string} filepath
 */
function write(subcommand, keychain, value, filepath) {
  value = JSON.parse(value);
  switch (subcommand) {
    case "localpackagejson":
      break;
    default:
      console.error(`Unknown write command: ${subcommand}`);
      process.exit(1);
  }
}

/**
 * @param {string[]} argv
 */
function main(argv) {
  switch (argv[0]) {
    case "readliteral":
      literal = true;
    case "read":
      read(argv[1], argv[2], argv[3]);
      break;
    case "write":
      write(argv[1], argv[2], argv[3], argv[4]);
      break;
    default:
      console.error(`Unknown command: ${argv[0]}`);
  }
}

main(process.argv.slice(2));
