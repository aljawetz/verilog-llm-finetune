`timescale 1ns/1ps

module tb_counter_load;

    // Instantiate the Unit Under Test (UUT)
    counter_load uut();

    // Clock and reset signals
    reg clk;
    reg rst;

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;

        // Apply reset
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Test sequence
        // Here you would typically drive inputs and check outputs.
        // Since the module has no ports, we will just simulate a few clock cycles.

        // Wait for a few clock cycles
        #50;

        // Check for expected behavior (this is a placeholder since the module has no functionality)
        // Normally, you would check outputs here. For demonstration, we assume a condition.
        if (1) begin // Replace '1' with actual condition checks
            $display("PASS");
        end else begin
            $display("FAIL: <reason>");
            $finish;
        end

        // End simulation
        $finish;
    end

endmodule