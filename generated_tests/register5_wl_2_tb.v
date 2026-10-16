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

        // Wait for the clock to stabilize
        #10;

        // Test case 1: Load data into the register
        load = 1; 
        datain = 5'b10101; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b10101) begin
            $display("FAIL: Expected dataout = 10101, got %b", dataout);
            $finish;
        end

        // Test case 2: Load new data into the register
        datain = 5'b11111; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b11111) begin
            $display("FAIL: Expected dataout = 11111, got %b", dataout);
            $finish;
        end

        // Test case 3: Disable loading, should reset to zero
        load = 0; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b00000) begin
            $display("FAIL: Expected dataout = 00000, got %b", dataout);
            $finish;
        end

        // Test case 4: Load data again
        load = 1; 
        datain = 5'b00111; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b00111) begin
            $display("FAIL: Expected dataout = 00111, got %b", dataout);
            $finish;
        end

        // Test case 5: Disable loading again
        load = 0; 
        #10; // Wait for one clock cycle
        if (dataout !== 5'b00000) begin
            $display("FAIL: Expected dataout = 00000, got %b", dataout);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule