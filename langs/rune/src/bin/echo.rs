use rune::{Context, FromValue, Vm};
use std::sync::Arc;

fn main() -> rune::Result<()> {
    let context = Context::with_config(true)?;

    let mut sources = rune::sources!(
        entry => {
            pub fn echo(x) {
                x
            }
        }
    );

    let result = rune::prepare(&mut sources).with_context(&context).build();

    let unit = result?;

    let mut vm = Vm::new(Arc::new(context.runtime()), Arc::new(unit));

    for _ in 0..100000 {
        let output = vm.execute(["echo"], ("bench",))?.complete()?;
        let _output = String::from_value(output)?;
    }

    Ok(())
}
