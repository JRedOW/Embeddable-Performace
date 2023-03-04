use indoc::indoc;
use rhai::{Engine, EvalAltResult, Scope};

fn main() -> Result<(), Box<EvalAltResult>> {
    let engine = Engine::new();

    let script = indoc! {"
        fn echo(x) {
            x;
        }
    "};

    let ast = engine.compile(script)?;

    let mut scope = Scope::new();

    for _ in 0..100000 {
        let _result: String = engine.call_fn::<String>(&mut scope, &ast, "echo", ("bench",))?;
    }

    Ok(())
}
