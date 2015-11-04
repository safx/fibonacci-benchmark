actor Main
  fun fib(n: U32): U32 =>
    if n < 2 then
      return n
    else
      return fib(n - 1) + fib(n - 2)
    end

  new create(env: Env) =>
    let n: U32 = try env.args(1).u32() else 0 end
    env.out.print(fib(n).string())
