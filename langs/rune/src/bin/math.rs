use rune::{Context, FromValue, Vm};
use std::sync::Arc;

fn main() -> rune::Result<()> {
    let context = Context::with_config(true)?;

    let mut sources = rune::sources!(
        entry => {
            pub fn math(n) {
                n = n * 11.0;
                n = n - 1.0;
                n = n / 3.0;
                n = n + 5.0;
                n
            }
        }
    );

    let result = rune::prepare(&mut sources).with_context(&context).build();

    let unit = result?;

    let mut vm = Vm::new(Arc::new(context.runtime()), Arc::new(unit));

    for _ in 0..100000 {
        let output = vm.execute(["math"], (9.0,))?.complete()?;
        let _output = f64::from_value(output)?;
    }

    Ok(())
}
