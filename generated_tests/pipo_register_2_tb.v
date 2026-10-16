`timescale 1ns/1ps

module tb_pipo_register;

    // Inputs
    reg clk;
    reg reset;
    reg load;
    reg [3:0] d;

    // Outputs
    wire [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    pipo_register uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        load = 0;
        d = 4'b0000;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test 1: Check reset functionality
        if (q !== 4'b0000) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Load data into register
        d = 4'b1010; // Load value
        load = 1;   // Assert load
        #10;        // Wait for clock edge

        load = 0;   // Deassert load
        if (q !== 4'b1010) begin
            $display("FAIL: Load did not set q to 1010");
            $finish;
        end

        // Test 3: Check that q retains its value when load is not asserted
        #10; // Wait for another clock edge
        if (q !== 4'b1010) begin
            $display("FAIL: q changed when load was not asserted");
            $finish;
        end

        // Test 4: Reset while loaded
        reset = 1; // Assert reset
        #10;       // Wait for clock edge

        reset = 0; // Deassert reset
        if (q !== 4'b0000) begin
            $display("FAIL: Reset did not set q to 0 after load");
            $finish;
        end

        // Test 5: Load new data after reset
        d = 4'b1111; // Load new value
        load = 1;    // Assert load
        #10;         // Wait for clock edge

        load = 0;    // Deassert load
        if (q !== 4'b1111) begin
            $display("FAIL: Load did not set q to 1111");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule