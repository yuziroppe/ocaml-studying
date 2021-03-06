(* The definition of the abstract syntax tree *)
type id = string

type var = Var of id | IndexedVar of var * exp

and stmt =
  | Assign of var * exp
  | IncAssign of var * exp
  | PostInc of var
  | CallProc of id * exp list
  | Block of dec list * stmt list
  | If of exp * stmt * stmt option
  | While of exp * stmt
  | DoWhile of exp * stmt
  | For of var * exp * exp * stmt
  | NilStmt

and exp =
  | VarExp of var
  | StrExp of string
  | IntExp of int
  | CallFunc of id * exp list

and dec =
  | VoidFuncDec of id * (typ * id) list * typ * stmt
  | FuncDec of id * (typ * id) list * typ * stmt * exp
  | TypeDec of id * typ
  | VarDec of typ * id

and typ = NameTyp of string | ArrayTyp of int * typ | IntTyp | VoidTyp
