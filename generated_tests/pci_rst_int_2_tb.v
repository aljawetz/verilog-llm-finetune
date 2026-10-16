`timescale 1ns/1ps

module tb_pci_rst_int;

    // Parameters
    reg clk_in;
    reg rst_i;
    reg pci_rstn_in;
    reg conf_soft_res_in;
    wire reset;
    wire pci_rstn_out;
    wire pci_rstn_en_out;
    wire rst_o;
    reg pci_intan_in;
    reg conf_int_in;
    reg int_i;
    wire pci_intan_out;
    wire pci_intan_en_out;
    wire int_o;
    wire conf_isr_int_prop_out;
    reg init_complete_in;

    // Instantiate the Unit Under Test (UUT)
    pci_rst_int uut (
        .clk_in(clk_in),
        .rst_i(rst_i),
        .pci_rstn_in(pci_rstn_in),
        .conf_soft_res_in(conf_soft_res_in),
        .reset(reset),
        .pci_rstn_out(pci_rstn_out),
        .pci_rstn_en_out(pci_rstn_en_out),
        .rst_o(rst_o),
        .pci_intan_in(pci_intan_in),
        .conf_int_in(conf_int_in),
        .int_i(int_i),
        .pci_intan_out(pci_intan_out),
        .pci_intan_en_out(pci_intan_en_out),
        .int_o(int_o),
        .conf_isr_int_prop_out(conf_isr_int_prop_out),
        .init_complete_in(init_complete_in)
    );

    // Clock generation
    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_i = 1;
        pci_rstn_in = 1;
        conf_soft_res_in = 0;
        pci_intan_in = 1;
        conf_int_in = 0;
        int_i = 0;
        init_complete_in = 0;

        // Wait for global reset
        #10;
        rst_i = 0; // Release reset
        #10;

        // Test case 1: Check reset propagation in HOST mode
        `define HOST
        if (reset !== 0) $display("FAIL: Reset should be 0 in HOST mode");
        if (pci_rstn_en_out !== ~(rst_i || conf_soft_res_in)) $display("FAIL: pci_rstn_en_out incorrect in HOST mode");
        if (rst_o !== 0) $display("FAIL: rst_o should be 0 in HOST mode");
        
        // Test case 2: Check interrupt propagation in HOST mode
        if (conf_isr_int_prop_out !== ~pci_intan_in) $display("FAIL: conf_isr_int_prop_out incorrect in HOST mode");
        if (int_o !== conf_int_in) $display("FAIL: int_o should match conf_int_in in HOST mode");
        
        // Test case 3: Check reset propagation in GUEST mode
        `undef HOST
        `define GUEST
        pci_rstn_in = 0; // Simulate active low reset
        #10;
        if (reset !== 1) $display("FAIL: Reset should be 1 in GUEST mode");
        if (rst_o !== (~pci_rstn_in || conf_soft_res_in)) $display("FAIL: rst_o incorrect in GUEST mode");
        
        // Test case 4: Check interrupt propagation in GUEST mode
        conf_int_in = 1;
        if (conf_isr_int_prop_out !== int_i) $display("FAIL: conf_isr_int_prop_out incorrect in GUEST mode");
        if (int_o !== 0) $display("FAIL: int_o should be 0 in GUEST mode");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule