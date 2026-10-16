`timescale 1ns/1ps

module tb_pci_target32_clk_en;

    // Inputs
    reg addr_phase;
    reg config_access;
    reg addr_claim_in;
    reg pci_frame_in;
    reg state_wait;
    reg state_transfere;
    reg state_default;

    // Outputs
    wire clk_enable;

    // Instantiate the Unit Under Test (UUT)
    pci_target32_clk_en uut (
        .addr_phase(addr_phase),
        .config_access(config_access),
        .addr_claim_in(addr_claim_in),
        .pci_frame_in(pci_frame_in),
        .state_wait(state_wait),
        .state_transfere(state_transfere),
        .state_default(state_default),
        .clk_enable(clk_enable)
    );

    // Clock generation
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test procedure
    initial begin
        // Initialize inputs
        addr_phase = 0;
        config_access = 0;
        addr_claim_in = 0;
        pci_frame_in = 0;
        state_wait = 0;
        state_transfere = 0;
        state_default = 0;

        // Test case 1: Check clk_enable in IDLE state
        addr_phase = 1; config_access = 1; addr_claim_in = 0; pci_frame_in = 0; state_wait = 0; state_transfere = 0; state_default = 0;
        #10;
        if (clk_enable !== 1) $display("FAIL: Test case 1 failed (IDLE state with config_access)"); 

        // Test case 2: Check clk_enable in IDLE state with claimed address
        addr_phase = 1; config_access = 0; addr_claim_in = 1; pci_frame_in = 0; state_wait = 0; state_transfere = 0; state_default = 0;
        #10;
        if (clk_enable !== 1) $display("FAIL: Test case 2 failed (IDLE state with claimed address)"); 

        // Test case 3: Check clk_enable in WAIT state
        addr_phase = 0; config_access = 0; addr_claim_in = 0; pci_frame_in = 0; state_wait = 1; state_transfere = 0; state_default = 0;
        #10;
        if (clk_enable !== 1) $display("FAIL: Test case 3 failed (WAIT state)"); 

        // Test case 4: Check clk_enable in DEFAULT state
        addr_phase = 0; config_access = 0; addr_claim_in = 0; pci_frame_in = 0; state_wait = 0; state_transfere = 0; state_default = 1;
        #10;
        if (clk_enable !== 1) $display("FAIL: Test case 4 failed (DEFAULT state)"); 

        // Test case 5: Check clk_enable in TRANSFERE state
        addr_phase = 0; config_access = 0; addr_claim_in = 0; pci_frame_in = 1; state_wait = 0; state_transfere = 1; state_default = 0;
        #10;
        if (clk_enable !== 1) $display("FAIL: Test case 5 failed (TRANSFERE state)"); 

        // Test case 6: Check clk_enable when no conditions are met
        addr_phase = 0; config_access = 0; addr_claim_in = 0; pci_frame_in = 0; state_wait = 0; state_transfere = 0; state_default = 0;
        #10;
        if (clk_enable !== 0) $display("FAIL: Test case 6 failed (No conditions met)"); 

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule