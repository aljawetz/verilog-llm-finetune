`timescale 1ns/1ps

module tb_pwm_gen;

reg clk;
wire [7:0] led;

// Instantiate the module under test
pwm_gen uut (
    .clk(clk),
    .led(led)
);

// Clock generation
always begin
    #5 clk = ~clk; // 100MHz clock
end

initial begin
    // Initialize
    clk = 0;

    // Wait for a few clock cycles to observe the behavior
    #10;

    // Check the LED outputs for the first 100 clock cycles
    for (integer i = 0; i < 100; i = i + 1) begin
        #10; // Wait for two clock cycles
        case (i)
            0: if (led !== 8'b00000000) $display("FAIL: LED outputs incorrect at counter %d", i);
            9: if (led !== 8'b00000001) $display("FAIL: LED outputs incorrect at counter %d", i);
            19: if (led !== 8'b00000011) $display("FAIL: LED outputs incorrect at counter %d", i);
            29: if (led !== 8'b00000111) $display("FAIL: LED outputs incorrect at counter %d", i);
            39: if (led !== 8'b00001111) $display("FAIL: LED outputs incorrect at counter %d", i);
            49: if (led !== 8'b00011111) $display("FAIL: LED outputs incorrect at counter %d", i);
            59: if (led !== 8'b00111111) $display("FAIL: LED outputs incorrect at counter %d", i);
            69: if (led !== 8'b01111111) $display("FAIL: LED outputs incorrect at counter %d", i);
            79: if (led !== 8'b11111111) $display("FAIL: LED outputs incorrect at counter %d", i);
            80: if (led !== 8'b11111111) $display("FAIL: LED outputs incorrect at counter %d", i);
            89: if (led !== 8'b11111111) $display("FAIL: LED outputs incorrect at counter %d", i);
            99: if (led !== 8'b11111111) $display("FAIL: LED outputs incorrect at counter %d", i);
        endcase
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule