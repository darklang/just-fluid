/* This is designed to be used as Json.Encode in Prelude. Don't use it
 * directly unless you have to. */

include module type of Json.Encode

let variant: (string, list<Js.Json.t>) => Js.Json.t

let strSet: Tc.Set.String.t => Js.Json.t

let strDict: ('a => Js.Json.t, Tc.Map.String.t<'a>) => Js.Json.t

let strListDict: ('a => Js.Json.t, Tc.Map.String.t<'a>) => Js.Json.t

let beltStrDict: ('a => Js.Json.t, Belt.Map.String.t<'a>) => Js.Json.t

let date: Js.Date.t => Js.Json.t

let uint64: UInt64.t => Js.Json.t
let int64: int64 => Js.Json.t
let float': float => Js.Json.t
let tuple5: (
  encoder<'a>,
  encoder<'b>,
  encoder<'c>,
  encoder<'d>,
  encoder<'e>,
) => encoder<('a, 'b, 'c, 'd, 'e)>

let result: ('ok => Js.Json.t, 'err => Js.Json.t, result<'ok, 'err>) => Js.Json.t

let base64EncodedBytes: Bytes.t => Js.Json.t
let base64ToString: Bytes.t => string
