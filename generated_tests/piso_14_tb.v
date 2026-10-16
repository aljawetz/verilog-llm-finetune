`timescale 1ns/1ps

module tb_piso;

    reg clk;
    reg reset;
    reg [3:0] datain;
    reg load;
    wire dataout;

    // Instantiate the module under test (uut)
    piso uut (
        .clk(clk),
        .reset(reset),
        .datain(datain),
        .load(load),
        .dataout(dataout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        load = 0;
        datain = 4'b0000;

        // Wait for a few clock cycles
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Test loading data
        datain = 4'b1010; // Load 1010
        load = 1;
        #10;
        load = 0;

        // Check output after loading
        if (dataout !== 0) begin
            $display("FAIL: Output should be 0 after loading data");
            $finish;
        end

        // Shift and check outputs
        #10; // Shift 1
        if (dataout !== 0) begin
            $display("FAIL: Expected output 0, got %b", dataout);
            $finish;
        end

        #10; // Shift 2
        if (dataout !== 1) begin
            $display("FAIL: Expected output 1, got %b", dataout);
            $finish;
        end

        #10; // Shift 3
        if (dataout !== 0) begin
            $display("FAIL: Expected output 0, got %b", dataout);
            $finish;
        end

        #10; // Shift 4
        if (dataout !== 1) begin
            $display("FAIL: Expected output 1, got %b", dataout);
            $finish;
        end

        // Reset the module
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Check output after reset
        if (dataout !== 0) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end

        // Load new data
        datain = 4'b1100; // Load 1100
        load = 1;
        #10;
        load = 0;

        // Shift and check outputs
        #10; // Shift 1
        if (dataout !== 0) begin
            $display("FAIL: Expected output 0, got %b", dataout);
            $finish;
        end

        #10; // Shift 2
        if (dataout !== 0) begin
            $display("FAIL: Expected output 0, got %b", dataout);
            $finish;
        end

        #10; // Shift 3
        if (dataout !== 1) begin
            $display("FAIL: Expected output 1, got %b", dataout);
            $finish;
        end

        #10; // Shift 4
        if (dataout !== 1) begin
            $display("FAIL: Expected output 1, got %b", dataout);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule