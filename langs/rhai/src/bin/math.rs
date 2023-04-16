use indoc::indoc;
use rhai::{Engine, EvalAltResult, Scope};

fn main() -> Result<(), Box<EvalAltResult>> {
    let engine = Engine::new();

    let script = indoc! {"
        fn math(n) {
            n = n * 11;
            n = n - 1;
            n = n / 3;
            n = n + 5;
            n;
        }
    "};

    let ast = engine.compile(script)?;

    let mut scope = Scope::new();

    for _ in 0..100000 {
        let _result = engine.call_fn::<f64>(&mut scope, &ast, "math", (9.0_f64,))?;
    }

    Ok(())
}
