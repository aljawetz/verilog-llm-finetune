`timescale 1ns/1ps

module tb_pci_target32_trdy_crit;

    // Inputs
    reg trdy_w;
    reg trdy_w_frm;
    reg trdy_w_frm_irdy;
    reg pci_frame_in;
    reg pci_irdy_in;

    // Outputs
    wire pci_trdy_out;

    // Instantiate the Unit Under Test (UUT)
    pci_target32_trdy_crit uut (
        .trdy_w(trdy_w),
        .trdy_w_frm(trdy_w_frm),
        .trdy_w_frm_irdy(trdy_w_frm_irdy),
        .pci_frame_in(pci_frame_in),
        .pci_irdy_in(pci_irdy_in),
        .pci_trdy_out(pci_trdy_out)
    );

    initial begin
        // Initialize Inputs
        trdy_w = 0;
        trdy_w_frm = 0;
        trdy_w_frm_irdy = 0;
        pci_frame_in = 0;
        pci_irdy_in = 0;

        // Test Case 1: All inputs low
        #10;
        if (pci_trdy_out !== 1) $display("FAIL: Test Case 1 failed, expected 1, got %b", pci_trdy_out);

        // Test Case 2: trdy_w is high
        trdy_w = 1;
        #10;
        if (pci_trdy_out !== 0) $display("FAIL: Test Case 2 failed, expected 0, got %b", pci_trdy_out);

        // Test Case 3: trdy_w_frm is high, pci_frame_in is low
        trdy_w = 0; trdy_w_frm = 1; pci_frame_in = 0;
        #10;
        if (pci_trdy_out !== 1) $display("FAIL: Test Case 3 failed, expected 1, got %b", pci_trdy_out);

        // Test Case 4: trdy_w_frm is high, pci_frame_in is high
        pci_frame_in = 1;
        #10;
        if (pci_trdy_out !== 0) $display("FAIL: Test Case 4 failed, expected 0, got %b", pci_trdy_out);

        // Test Case 5: trdy_w_frm_irdy is high, pci_frame_in is high, pci_irdy_in is low
        trdy_w_frm = 0; trdy_w_frm_irdy = 1; pci_irdy_in = 0;
        #10;
        if (pci_trdy_out !== 1) $display("FAIL: Test Case 5 failed, expected 1, got %b", pci_trdy_out);

        // Test Case 6: trdy_w_frm_irdy is high, pci_frame_in and pci_irdy_in are high
        pci_frame_in = 1; pci_irdy_in = 1;
        #10;
        if (pci_trdy_out !== 0) $display("FAIL: Test Case 6 failed, expected 0, got %b", pci_trdy_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule