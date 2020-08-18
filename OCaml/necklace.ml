(* MAIN PROBLEM *)
let explode s = List.init (String.length s) (String.get s);;

let rec add_all a b =
  match a with
  | [] -> b
  | h::t -> h::(add_all t b)
;;

let rot_o n =
  match n with
  | [] -> []
  | h::t -> add_all t [h] 
;;

let rec equals a b =
  match (a, b) with
  | ([], []) -> true
  | (lh::lt, rh::rt) when lh = rh -> equals lt rt
  | _ -> false
;;

let rec sn_helper a b c =
  if equals a b then true
  else if equals b c then false
  else sn_helper a (rot_o b) c
;;

let same_necklace a b =
  let b_e = explode b in
  sn_helper (explode a) (rot_o b_e) b_e
;;

(* BONUS 1 *)
let length n =
  match n with
  | [] -> 0
  | h::t -> 1 + length t
;;

let rec r_helper a b t =
  if t = 0 then 1
  else if equals a b then 1 + (r_helper (rot_o a) b (t - 1))
  else r_helper (rot_o a) b (t - 1)
;;

let repeats n =
  let n_e = explode n in
  let l = length n_e in
  (r_helper (rot_o n_e) n_e l) - 1
;;
