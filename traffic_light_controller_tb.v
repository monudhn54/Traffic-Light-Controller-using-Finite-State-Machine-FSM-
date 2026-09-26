// =============================================================
// Testbench    : traffic_light_controller_tb
// Description  : Verifies state transitions and signal outputs
//                of the Moore FSM traffic light controller.
// =============================================================

`timescale 1ns / 1ps

module traffic_light_controller_tb;

    reg clk;
    reg reset;
    wire red, yellow, green;

    // Instantiate the Device Under Test (DUT)
    traffic_light_controller dut (
        .clk    (clk),
        .reset  (reset),
        .red    (red),
        .yellow (yellow),
        .green  (green)
    );

    // -----------------------------
    // Clock generation: 10ns period
    // -----------------------------
    initial clk = 0;
    always #5 clk = ~clk;

    // -----------------------------
    // Stimulus
    // -----------------------------
    initial begin
        $dumpfile("simulation_waveform.vcd");
        $dumpvars(0, traffic_light_controller_tb);

        // Apply reset
        reset = 1;
        #12;
        reset = 0;

        // Let the FSM run through a few full cycles
        #400;

        $finish;
    end

    // -----------------------------
    // Monitor state changes
    // -----------------------------
    initial begin
        $display("Time\tReset\tRED\tYELLOW\tGREEN");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, reset, red, yellow, green);
    end

endmodule
