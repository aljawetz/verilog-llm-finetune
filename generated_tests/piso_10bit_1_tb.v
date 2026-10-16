`timescale 1ns/1ps

module tb_piso_10bit;

    reg clk;
    reg rst_n;
    reg [9:0] par_in;
    reg load_en;
    wire ser_out;

    // Instantiate the module under test
    piso_10bit uut (
        .clk(clk),
        .rst_n(rst_n),
        .par_in(par_in),
        .load_en(load_en),
        .ser_out(ser_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        load_en = 0;
        par_in = 10'b0000000000;

        // Release reset
        #10;
        rst_n = 1;

        // Test 1: Load a value and shift out
        par_in = 10'b1010101010; // Load this value
        load_en = 1; // Enable loading
        #10; // Wait for one clock cycle
        load_en = 0; // Disable loading

        // Check the output after each shift
        #10; if (ser_out !== 0) $display("FAIL: Expected ser_out = 0, got %b", ser_out);
        #10; if (ser_out !== 1) $display("FAIL: Expected ser_out = 1, got %b", ser_out);
        #10; if (ser_out !== 0) $display("FAIL: Expected ser_out = 0, got %b", ser_out);
        #10; if (ser_out !== 1) $display("FAIL: Expected ser_out = 1, got %b", ser_out);
        #10; if (ser_out !== 0) $display("FAIL: Expected ser_out = 0, got %b", ser_out);
        #10; if (ser_out !== 1) $display("FAIL: Expected ser_out = 1, got %b", ser_out);
        #10; if (ser_out !== 0) $display("FAIL: Expected ser_out = 0, got %b", ser_out);
        #10; if (ser_out !== 1) $display("FAIL: Expected ser_out = 1, got %b", ser_out);
        #10; if (ser_out !== 0) $display("FAIL: Expected ser_out = 0, got %b", ser_out);
        #10; if (ser_out !== 1) $display("FAIL: Expected ser_out = 1, got %b", ser_out);

        // Test 2: Reset the module
        rst_n = 0; // Assert reset
        #10; 
        rst_n = 1; // Release reset

        // Check that the output is zero after reset
        #10; if (ser_out !== 0) $display("FAIL: Expected ser_out = 0 after reset, got %b", ser_out);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule