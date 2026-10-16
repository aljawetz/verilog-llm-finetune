`timescale 1ns/1ps

module tb_wb_conmax_master_if;

    // Parameters
    parameter DW = 2; // Data width
    parameter AW = 2; // Address width
    parameter SW = DW / 8; // Select width

    // Inputs
    reg clk_i;
    reg rst_i;
    reg [DW-1:0] wb_data_i;
    reg [AW-1:0] wb_addr_i;
    reg [SW-1:0] wb_sel_i;
    reg wb_we_i;
    reg wb_cyc_i;
    reg wb_stb_i;
    reg [2:0] wb_cti_i;
    reg [1:0] wb_bte_i;

    // Outputs
    wire [DW-1:0] wb_data_o;
    wire wb_ack_o;
    wire wb_err_o;
    wire wb_rty_o;
    
    // Slave interfaces
    reg [DW-1:0] s0_data_i;
    wire [DW-1:0] s0_data_o;
    wire [AW-1:0] s0_addr_o;
    wire [SW-1:0] s0_sel_o;
    wire s0_we_o;
    wire s0_cyc_o;
    wire s0_stb_o;
    reg s0_ack_i;
    reg s0_err_i;
    reg s0_rty_i;

    // Instantiate the Unit Under Test (UUT)
    wb_conmax_master_if uut (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .wb_data_i(wb_data_i),
        .wb_data_o(wb_data_o),
        .wb_addr_i(wb_addr_i),
        .wb_sel_i(wb_sel_i),
        .wb_we_i(wb_we_i),
        .wb_cyc_i(wb_cyc_i),
        .wb_stb_i(wb_stb_i),
        .wb_ack_o(wb_ack_o),
        .wb_err_o(wb_err_o),
        .wb_rty_o(wb_rty_o),
        .wb_cti_i(wb_cti_i),
        .wb_bte_i(wb_bte_i),
        .s0_data_i(s0_data_i),
        .s0_data_o(s0_data_o),
        .s0_addr_o(s0_addr_o),
        .s0_sel_o(s0_sel_o),
        .s0_we_o(s0_we_o),
        .s0_cyc_o(s0_cyc_o),
        .s0_stb_o(s0_stb_o),
        .s0_ack_i(s0_ack_i),
        .s0_err_i(s0_err_i),
        .s0_rty_i(s0_rty_i)
    );

    // Clock generation
    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i; // 10 ns clock period
    end

    // Reset and test sequence
    initial begin
        // Initialize inputs
        rst_i = 1;
        wb_data_i = 0;
        wb_addr_i = 0;
        wb_sel_i = 0;
        wb_we_i = 0;
        wb_cyc_i = 0;
        wb_stb_i = 0;
        wb_cti_i = 0;
        wb_bte_i = 0;
        s0_data_i = 0;
        s0_ack_i = 0;
        s0_err_i = 0;
        s0_rty_i = 0;

        // Release reset
        #10;
        rst_i = 0;

        // Test case 1: Write to Slave 0
        wb_addr_i = 2'b00; // Address for Slave 0
        wb_data_i = 2'b10; // Data to write
        wb_sel_i = 2'b11; // Select all bytes
        wb_we_i = 1; // Write enable
        wb_cyc_i = 1; // Cycle valid
        wb_stb_i = 1; // Strobe valid
        #10;

        // Simulate Slave 0 response
        s0_ack_i = 1; // Acknowledge the write
        #10;
        s0_ack_i = 0; // Clear acknowledge

        // Check outputs
        if (wb_ack_o !== 1) begin
            $display("FAIL: Write to Slave 0 not acknowledged");
            $finish;
        end

        // Test case 2: Read from Slave 0
        wb_addr_i = 2'b00; // Address for Slave 0
        wb_we_i = 0; // Read operation
        wb_cyc_i = 1; // Cycle valid
        wb_stb_i = 1; // Strobe valid
        #10;

        // Simulate Slave 0 data response
        s0_data_i = 2'b10; // Data to read
        s0_ack_i = 1; // Acknowledge the read
        #10;
        s0_ack_i = 0; // Clear acknowledge

        // Check outputs
        if (wb_data_o !== 2'b10) begin
            $display("FAIL: Read from Slave 0 returned incorrect data");
            $finish;
        end

        // Test case 3: Error response from Slave 0
        wb_addr_i = 2'b00; // Address for Slave 0
        wb_we_i = 0; // Read operation
        wb_cyc_i = 1; // Cycle valid
        wb_stb_i = 1; // Strobe valid
        #10;

        // Simulate Slave 0 error response
        s0_err_i = 1; // Indicate error
        s0_ack_i = 1; // Acknowledge the read
        #10;
        s0_ack_i = 0; // Clear acknowledge
        s0_err_i = 0; // Clear error

        // Check outputs
        if (wb_err_o !== 1) begin
            $display("FAIL: Error response from Slave 0 not detected");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule