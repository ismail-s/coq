
(* $Id$ *)

open Names
open Term
open Sign

type discharge_recipe

type recipe =
  | Cooked of constr
  | Recipe of discharge_recipe

type constant_body = {
  const_kind : path_kind;
  const_body : recipe ref option;
  const_type : typed_type;
  const_hyps : context;
  mutable const_opaque : bool;
  mutable const_eval : ((int * constr) list * int * bool) option option;
}

type constant_entry = section_path * constant_body

val is_defined : constant_body -> bool

val is_opaque : constant_body -> bool

