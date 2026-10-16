`timescale 1ns/1ps

module tb_mux_out;

    // Parameters
    reg [31:0] adder_data;
    reg [1:0] adder_resp;
    reg [1:0] adder_tag;
    reg [31:0] shift_data;
    reg [1:0] shift_resp;
    reg [1:0] shift_tag;
    reg invalid_op;
    reg [1:0] invalid_op_tag;
    reg reset;
    reg scan_in;
    reg a_clk;
    reg b_clk;
    reg c_clk;
    wire [31:0] req_data;
    wire [1:0] req_resp;
    wire [1:0] req_tag;
    wire scan_out;

    // Instantiate the module under test
    mux_out uut (
        .req_data(req_data),
        .req_resp(req_resp),
        .req_tag(req_tag),
        .adder_data(adder_data),
        .adder_resp(adder_resp),
        .adder_tag(adder_tag),
        .shift_data(shift_data),
        .shift_resp(shift_resp),
        .shift_tag(shift_tag),
        .invalid_op(invalid_op),
        .invalid_op_tag(invalid_op_tag),
        .reset(reset),
        .scan_in(scan_in),
        .a_clk(a_clk),
        .b_clk(b_clk),
        .c_clk(c_clk),
        .scan_out(scan_out)
    );

    // Clock generation
    initial begin
        a_clk = 0;
        b_clk = 0;
        c_clk = 0;
        forever begin
            #5 a_clk = ~a_clk;
            #5 b_clk = ~b_clk;
            #5 c_clk = ~c_clk;
        end
    end

    // Test procedure
    initial begin
        // Initialize signals
        reset = 1;
        scan_in = 0;
        adder_data = 32'h0;
        adder_resp = 2'b00;
        adder_tag = 2'b00;
        shift_data = 32'h0;
        shift_resp = 2'b00;
        shift_tag = 2'b00;
        invalid_op = 0;
        invalid_op_tag = 2'b00;

        // Release reset
        #10 reset = 0;

        // Test case 1: Normal operation with adder response
        adder_data = 32'hA5A5A5A5;
        adder_resp = 2'b01; // Valid response
        adder_tag = 2'b10;
        #10;

        if (req_data !== 32'hA5A5A5A5) $display("FAIL: req_data mismatch in test case 1");
        if (req_resp !== 2'b01) $display("FAIL: req_resp mismatch in test case 1");
        if (req_tag !== 2'b10) $display("FAIL: req_tag mismatch in test case 1");

        // Test case 2: Normal operation with shift response
        shift_data = 32'h5A5A5A5A;
        shift_resp = 2'b10; // Valid response
        shift_tag = 2'b01;
        #10;

        if (req_data !== 32'h5A5A5A5A) $display("FAIL: req_data mismatch in test case 2");
        if (req_resp !== 2'b10) $display("FAIL: req_resp mismatch in test case 2");
        if (req_tag !== 2'b01) $display("FAIL: req_tag mismatch in test case 2");

        // Test case 3: Invalid operation
        invalid_op = 1;
        invalid_op_tag = 2'b11;
        #10;

        if (req_resp !== 2'b10) $display("FAIL: req_resp mismatch in test case 3");
        if (req_tag !== 2'b11) $display("FAIL: req_tag mismatch in test case 3");

        // Test case 4: Reset functionality
        reset = 1;
        #10;
        reset = 0;

        if (req_data !== 32'b0) $display("FAIL: req_data should be 0 after reset");
        if (req_resp !== 2'b00) $display("FAIL: req_resp should be 00 after reset");
        if (req_tag !== 2'b00) $display("FAIL: req_tag should be 00 after reset");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule