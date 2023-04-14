use rune::{Context, FromValue, Vm};
use std::sync::Arc;

fn main() -> rune::Result<()> {
    let context = Context::with_config(true)?;

    let mut sources = rune::sources!(
        entry => {
            pub fn fib(n) {
                if n <= 1 {
                    n
                } else {
                    fib(n - 1) + fib(n - 2)
                }
            }
        }
    );

    let result = rune::prepare(&mut sources).with_context(&context).build();

    let unit = result?;

    let mut vm = Vm::new(Arc::new(context.runtime()), Arc::new(unit));

    for _ in 0..1000 {
        let output = vm.execute(["fib"], (15,))?.complete()?;
        let _output = i64::from_value(output)?;
    }

    Ok(())
}
