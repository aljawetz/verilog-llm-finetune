`timescale 1ns/1ps

module tb_register5_wl;

    reg [4:0] datain;
    reg clock;
    reg load;
    wire [4:0] dataout;

    // Instantiate the module under test (uut)
    register5_wl uut (
        .datain(datain),
        .dataout(dataout),
        .clock(clock),
        .load(load)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        datain = 5'b00000;
        load = 0;

        // Wait for a clock edge
        #10;

        // Test 1: Load data into register
        load = 1; 
        datain = 5'b10101; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b10101) begin
            $display("FAIL: Test 1 failed, expected 10101, got %b", dataout);
            $finish;
        end

        // Test 2: Load new data into register
        datain = 5'b11011; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b11011) begin
            $display("FAIL: Test 2 failed, expected 11011, got %b", dataout);
            $finish;
        end

        // Test 3: Disable loading, expect output to be zero
        load = 0; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b00000) begin
            $display("FAIL: Test 3 failed, expected 00000, got %b", dataout);
            $finish;
        end

        // Test 4: Re-enable loading and check again
        load = 1; 
        datain = 5'b11111; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b11111) begin
            $display("FAIL: Test 4 failed, expected 11111, got %b", dataout);
            $finish;
        end

        // Final check: Disable loading again
        load = 0; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b00000) begin
            $display("FAIL: Final check failed, expected 00000, got %b", dataout);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule