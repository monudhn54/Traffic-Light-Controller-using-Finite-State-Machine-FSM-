// =============================================================
// Module      : traffic_light_controller
// Description : Moore FSM based Traffic Light Controller
// States      : RED -> GREEN -> YELLOW -> RED ...
// Author      : Mohit Kumar Soni
// =============================================================

module traffic_light_controller (
    input  wire clk,     // System clock
    input  wire reset,   // Active-high reset
    output reg  red,
    output reg  yellow,
    output reg  green
);

    // -----------------------------
    // State encoding
    // -----------------------------
    localparam [1:0] RED    = 2'b00,
                      GREEN  = 2'b01,
                      YELLOW = 2'b10;

    // -----------------------------
    // Timing parameters (in clock cycles)
    // -----------------------------
    localparam [3:0] RED_TIME    = 4'd10,
                      GREEN_TIME = 4'd8,
                      YELLOW_TIME= 4'd3;

    reg [1:0] state, next_state;
    reg [3:0] counter;
    wire      counter_done = (counter == 4'd0);

    // -----------------------------
    // Next-state logic (combinational)
    // -----------------------------
    always @(*) begin
        case (state)
            RED:     next_state = counter_done ? GREEN  : RED;
            GREEN:   next_state = counter_done ? YELLOW : GREEN;
            YELLOW:  next_state = counter_done ? RED    : YELLOW;
            default: next_state = RED;
        endcase
    end

    // -----------------------------
    // State register (single driver)
    // -----------------------------
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= RED;
        else
            state <= next_state;
    end

    // -----------------------------
    // Counter register (single driver)
    // Loads a fresh count whenever the state is about to change,
    // otherwise decrements.
    // -----------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= RED_TIME;
        end else if (counter_done) begin
            case (next_state)
                RED:     counter <= RED_TIME;
                GREEN:   counter <= GREEN_TIME;
                YELLOW:  counter <= YELLOW_TIME;
                default: counter <= RED_TIME;
            endcase
        end else begin
            counter <= counter - 1'b1;
        end
    end

    // -----------------------------
    // Output logic (Moore: depends only on current state)
    // -----------------------------
    always @(*) begin
        red    = 1'b0;
        yellow = 1'b0;
        green  = 1'b0;
        case (state)
            RED:    red    = 1'b1;
            GREEN:  green  = 1'b1;
            YELLOW: yellow = 1'b1;
        endcase
    end

endmodule
