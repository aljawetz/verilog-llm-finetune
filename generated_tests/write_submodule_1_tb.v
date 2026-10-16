`timescale 1ns/1ps

module tb_write_submodule;

    // Parameters
    parameter ADDR_WDTH = 4;
    parameter DATA_WDTH = 32;
    parameter RESP_WDTH = 1;

    // Inputs
    reg clk;
    reg rst_n;
    reg start;
    reg [DATA_WDTH-1:0] data;
    reg [ADDR_WDTH-1:0] addr;
    reg w_ready;
    reg b_valid;
    reg aw_ready;
    reg [RESP_WDTH-1:0] b_resp;

    // Outputs
    wire w_valid;
    wire [DATA_WDTH-1:0] w_data;
    wire b_ready;
    wire aw_valid;
    wire [ADDR_WDTH-1:0] aw_address;
    wire done;
    wire resp;
    wire swich_case_default;

    // Instantiate the Unit Under Test (UUT)
    write_submodule uut (
        .clk(clk),
        .rst_n(rst_n),
        .w_valid(w_valid),
        .w_ready(w_ready),
        .w_data(w_data),
        .b_valid(b_valid),
        .b_ready(b_ready),
        .b_resp(b_resp),
        .aw_valid(aw_valid),
        .aw_ready(aw_ready),
        .aw_address(aw_address),
        .start(start),
        .data(data),
        .addr(addr),
        .done(done),
        .resp(resp),
        .swich_case_default(swich_case_default)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Reset and stimulus generation
    initial begin
        // Initialize inputs
        rst_n = 0;
        start = 0;
        data = 32'hDEADBEEF;
        addr = 4'b0001;
        w_ready = 0;
        b_valid = 0;
        aw_ready = 0;
        b_resp = 1'b0;

        // Release reset
        #10;
        rst_n = 1;

        // Start the write transaction
        #10;
        start = 1;
        #10;
        start = 0;

        // Wait for the write to be valid
        wait(w_valid);
        #10;

        // Simulate memory readiness
        aw_ready = 1; // Address write ready
        #10;
        w_ready = 1; // Data write ready
        #10;

        // Simulate response from memory
        b_valid = 1; // Response valid
        #10;
        b_resp = 1'b1; // Response OK
        #10;

        // Wait for done signal
        wait(done);
        #10;

        // Check outputs
        if (aw_address !== addr) begin
            $display("FAIL: aw_address mismatch");
            $finish;
        end

        if (w_data !== data) begin
            $display("FAIL: w_data mismatch");
            $finish;
        end

        if (!done) begin
            $display("FAIL: done signal not asserted");
            $finish;
        end

        if (!resp) begin
            $display("FAIL: resp signal not correct");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule