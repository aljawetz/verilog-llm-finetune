`timescale 1ns/1ps

module tb_cntr;

    reg [15:0] d_in;
    reg ld;
    reg dec;
    reg clk;
    wire [15:0] d_out;

    // Instantiate the module under test (uut)
    cntr uut (
        .d_in(d_in),
        .ld(ld),
        .dec(dec),
        .clk(clk),
        .d_out(d_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        ld = 0;
        dec = 0;
        d_in = 16'h0000;
        
        // Test 1: Load a value into the counter
        d_in = 16'h00FF; // Load 255
        ld = 1; // Assert load
        #10; // Wait for one clock cycle
        ld = 0; // Deassert load
        #10; // Wait for one clock cycle
        if (d_out !== 16'h00FF) begin
            $display("FAIL: Expected d_out = 0x00FF, got d_out = 0x%h", d_out);
            $finish;
        end

        // Test 2: Decrement the counter
        dec = 1; // Assert decrement
        #10; // Wait for one clock cycle
        dec = 0; // Deassert decrement
        #10; // Wait for one clock cycle
        if (d_out !== 16'h00FE) begin
            $display("FAIL: Expected d_out = 0x00FE, got d_out = 0x%h", d_out);
            $finish;
        end

        // Test 3: Load a new value
        d_in = 16'h0001; // Load 1
        ld = 1; // Assert load
        #10; // Wait for one clock cycle
        ld = 0; // Deassert load
        #10; // Wait for one clock cycle
        if (d_out !== 16'h0001) begin
            $display("FAIL: Expected d_out = 0x0001, got d_out = 0x%h", d_out);
            $finish;
        end

        // Test 4: Decrement until zero
        dec = 1; // Assert decrement
        #10; // Wait for one clock cycle
        dec = 0; // Deassert decrement
        #10; // Wait for one clock cycle
        if (d_out !== 16'h0000) begin
            $display("FAIL: Expected d_out = 0x0000, got d_out = 0x%h", d_out);
            $finish;
        end

        // Test 5: Load a value and decrement
        d_in = 16'h000A; // Load 10
        ld = 1; // Assert load
        #10; // Wait for one clock cycle
        ld = 0; // Deassert load
        #10; // Wait for one clock cycle
        dec = 1; // Assert decrement
        #10; // Wait for one clock cycle
        dec = 0; // Deassert decrement
        #10; // Wait for one clock cycle
        if (d_out !== 16'h0009) begin
            $display("FAIL: Expected d_out = 0x0009, got d_out = 0x%h", d_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule