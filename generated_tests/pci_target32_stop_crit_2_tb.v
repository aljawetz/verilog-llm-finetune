`timescale 1ns/1ps

module tb_pci_target32_stop_crit;

    // Inputs
    reg stop_w;
    reg stop_w_frm;
    reg stop_w_frm_irdy;
    reg pci_frame_in;
    reg pci_irdy_in;

    // Outputs
    wire pci_stop_out;

    // Instantiate the Unit Under Test (UUT)
    pci_target32_stop_crit uut (
        .stop_w(stop_w),
        .stop_w_frm(stop_w_frm),
        .stop_w_frm_irdy(stop_w_frm_irdy),
        .pci_frame_in(pci_frame_in),
        .pci_irdy_in(pci_irdy_in),
        .pci_stop_out(pci_stop_out)
    );

    initial begin
        // Initialize Inputs
        stop_w = 0;
        stop_w_frm = 0;
        stop_w_frm_irdy = 0;
        pci_frame_in = 0;
        pci_irdy_in = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: All inputs low, expect pci_stop_out = 1
        #10;
        if (pci_stop_out !== 1) begin
            $display("FAIL: Test case 1 failed, expected pci_stop_out = 1");
            $finish;
        end

        // Test case 2: stop_w = 1, expect pci_stop_out = 0
        stop_w = 1;
        #10;
        if (pci_stop_out !== 0) begin
            $display("FAIL: Test case 2 failed, expected pci_stop_out = 0");
            $finish;
        end

        // Test case 3: stop_w = 0, stop_w_frm = 1, pci_frame_in = 0, expect pci_stop_out = 0
        stop_w = 0;
        stop_w_frm = 1;
        pci_frame_in = 0;
        #10;
        if (pci_stop_out !== 0) begin
            $display("FAIL: Test case 3 failed, expected pci_stop_out = 0");
            $finish;
        end

        // Test case 4: stop_w_frm_irdy = 1, pci_frame_in = 0, pci_irdy_in = 0, expect pci_stop_out = 0
        stop_w_frm_irdy = 1;
        #10;
        if (pci_stop_out !== 0) begin
            $display("FAIL: Test case 4 failed, expected pci_stop_out = 0");
            $finish;
        end

        // Test case 5: stop_w_frm_irdy = 1, pci_frame_in = 1, pci_irdy_in = 0, expect pci_stop_out = 1
        pci_frame_in = 1;
        #10;
        if (pci_stop_out !== 1) begin
            $display("FAIL: Test case 5 failed, expected pci_stop_out = 1");
            $finish;
        end

        // Test case 6: stop_w_frm_irdy = 1, pci_frame_in = 1, pci_irdy_in = 1, expect pci_stop_out = 1
        pci_irdy_in = 1;
        #10;
        if (pci_stop_out !== 1) begin
            $display("FAIL: Test case 6 failed, expected pci_stop_out = 1");
            $finish;
        end

        // Test case 7: stop_w_frm = 1, pci_frame_in = 0, pci_irdy_in = 1, expect pci_stop_out = 0
        stop_w_frm = 1;
        pci_frame_in = 0;
        #10;
        if (pci_stop_out !== 0) begin
            $display("FAIL: Test case 7 failed, expected pci_stop_out = 0");
            $finish;
        end

        // Test case 8: stop_w_frm = 0, stop_w_frm_irdy = 1, pci_frame_in = 0, pci_irdy_in = 1, expect pci_stop_out = 1
        stop_w_frm = 0;
        stop_w_frm_irdy = 1;
        #10;
        if (pci_stop_out !== 1) begin
            $display("FAIL: Test case 8 failed, expected pci_stop_out = 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule