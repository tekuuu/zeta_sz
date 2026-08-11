import Lake
open Lake DSL

package ZetaSimpleZeros where
  version := v!"0.1.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @
    "51e6992efd06126df61a496bebf8f49482a4e129"

@[default_target]
lean_lib ZetaSimpleZeros where
  leanOptions := #[⟨`relaxedAutoImplicit, false⟩]
