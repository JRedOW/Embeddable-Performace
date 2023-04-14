use indoc::indoc;
use rhai::{Engine, EvalAltResult, Scope};

fn main() -> Result<(), Box<EvalAltResult>> {
    let engine = Engine::new();

    let script = indoc! {"
        fn fib(n) {
            if n < 2 {
                n;
            } else {
                fib(n-1) + fib(n-2);
            }
        }
    "};

    let ast = engine.compile(script)?;

    let mut scope = Scope::new();

    for _ in 0..1000 {
        let _result = engine.call_fn::<i64>(&mut scope, &ast, "fib", (15_i64,))?;
    }

    Ok(())
}
