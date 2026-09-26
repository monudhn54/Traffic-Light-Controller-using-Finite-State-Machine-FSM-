# Waveform

Place your `simulation_waveform.png` here — a screenshot of the GTKWave (or other viewer)
output showing `clk`, `reset`, `red`, `yellow`, and `green` after running:

```bash
iverilog -o tlc_sim ../src/traffic_light_controller.v ../simulation/traffic_light_controller_tb.v
vvp tlc_sim
gtkwave simulation_waveform.vcd
```
