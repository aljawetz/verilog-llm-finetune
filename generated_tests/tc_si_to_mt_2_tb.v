`timescale 1ns/1ps

module tb_tc_si_to_mt;

    // Parameters
    reg i0_wb_cyc_i;
    reg i0_wb_stb_i;
    reg [1:0] i0_wb_adr_i;
    reg [1:0] i0_wb_sel_i;
    reg i0_wb_we_i;
    reg [1:0] i0_wb_dat_i;
    wire [1:0] i0_wb_dat_o;
    wire i0_wb_ack_o;
    wire i0_wb_err_o;
    wire t0_wb_cyc_o;
    wire t0_wb_stb_o;
    wire [1:0] t0_wb_adr_o;
    wire [1:0] t0_wb_sel_o;
    wire t0_wb_we_o;
    wire [1:0] t0_wb_dat_o;
    reg [1:0] t0_wb_dat_i;
    reg t0_wb_ack_i;
    reg t0_wb_err_i;

    // Instantiate the Unit Under Test (UUT)
    tc_si_to_mt uut (
        .i0_wb_cyc_i(i0_wb_cyc_i),
        .i0_wb_stb_i(i0_wb_stb_i),
        .i0_wb_adr_i(i0_wb_adr_i),
        .i0_wb_sel_i(i0_wb_sel_i),
        .i0_wb_we_i(i0_wb_we_i),
        .i0_wb_dat_i(i0_wb_dat_i),
        .i0_wb_dat_o(i0_wb_dat_o),
        .i0_wb_ack_o(i0_wb_ack_o),
        .i0_wb_err_o(i0_wb_err_o),
        .t0_wb_cyc_o(t0_wb_cyc_o),
        .t0_wb_stb_o(t0_wb_stb_o),
        .t0_wb_adr_o(t0_wb_adr_o),
        .t0_wb_sel_o(t0_wb_sel_o),
        .t0_wb_we_o(t0_wb_we_o),
        .t0_wb_dat_o(t0_wb_dat_o),
        .t0_wb_dat_i(t0_wb_dat_i),
        .t0_wb_ack_i(t0_wb_ack_i),
        .t0_wb_err_i(t0_wb_err_i)
    );

    // Clock and Reset
    initial begin
        i0_wb_cyc_i = 0;
        i0_wb_stb_i = 0;
        i0_wb_adr_i = 0;
        i0_wb_sel_i = 0;
        i0_wb_we_i = 0;
        i0_wb_dat_i = 0;
        t0_wb_ack_i = 0;
        t0_wb_err_i = 0;

        // Test Sequence
        #10;
        // Test Write to Target 0
        i0_wb_cyc_i = 1;
        i0_wb_stb_i = 1;
        i0_wb_adr_i = 2'b00; // Address for target 0
        i0_wb_sel_i = 2'b11; // Select all bytes
        i0_wb_we_i = 1;      // Write enable
        i0_wb_dat_i = 2'b10; // Data to write

        #10;
        t0_wb_ack_i = 1; // Acknowledge from target 0
        #10;
        if (i0_wb_ack_o !== 1) begin
            $display("FAIL: Expected i0_wb_ack_o to be 1");
            $finish;
        end

        // Test Read from Target 0
        i0_wb_cyc_i = 1;
        i0_wb_stb_i = 1;
        i0_wb_adr_i = 2'b00; // Address for target 0
        i0_wb_we_i = 0;      // Read operation

        #10;
        t0_wb_dat_i = 2'b10; // Data to return from target 0
        t0_wb_ack_i = 1;     // Acknowledge from target 0
        #10;
        if (i0_wb_dat_o !== 2'b10) begin
            $display("FAIL: Expected i0_wb_dat_o to be 2'b10");
            $finish;
        end

        // Test Error Condition
        i0_wb_cyc_i = 1;
        i0_wb_stb_i = 1;
        i0_wb_adr_i = 2'b01; // Address for target 1 (not connected)
        i0_wb_we_i = 1;      // Write operation
        i0_wb_dat_i = 2'b11; // Data to write

        #10;
        t0_wb_err_i = 1; // Indicate error from target 0
        #10;
        if (i0_wb_err_o !== 1) begin
            $display("FAIL: Expected i0_wb_err_o to be 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule