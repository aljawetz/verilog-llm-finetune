`timescale 1ns/1ps

module tb_pci_cbe_en_crit;

    // Inputs
    reg cbe_en_slow_in;
    reg cbe_en_keep_in;
    reg pci_stop_in;
    reg pci_trdy_in;

    // Outputs
    wire pci_cbe_en_out;

    // Instantiate the Unit Under Test (UUT)
    pci_cbe_en_crit uut (
        .pci_cbe_en_out(pci_cbe_en_out),
        .cbe_en_slow_in(cbe_en_slow_in),
        .cbe_en_keep_in(cbe_en_keep_in),
        .pci_stop_in(pci_stop_in),
        .pci_trdy_in(pci_trdy_in)
    );

    initial begin
        // Initialize Inputs
        cbe_en_slow_in = 0;
        cbe_en_keep_in = 0;
        pci_stop_in = 0;
        pci_trdy_in = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: cbe_en_slow_in is high
        cbe_en_slow_in = 1;
        #10;
        if (pci_cbe_en_out !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: cbe_en_slow_in is low, but all other inputs are high
        cbe_en_slow_in = 0;
        cbe_en_keep_in = 1;
        pci_stop_in = 1;
        pci_trdy_in = 1;
        #10;
        if (pci_cbe_en_out !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: cbe_en_slow_in is low, not all other inputs are high
        cbe_en_keep_in = 1;
        pci_stop_in = 0;
        pci_trdy_in = 1;
        #10;
        if (pci_cbe_en_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: All inputs low
        cbe_en_slow_in = 0;
        cbe_en_keep_in = 0;
        pci_stop_in = 0;
        pci_trdy_in = 0;
        #10;
        if (pci_cbe_en_out !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: cbe_en_keep_in is high, pci_stop_in is high, pci_trdy_in is low
        cbe_en_keep_in = 1;
        pci_stop_in = 1;
        pci_trdy_in = 0;
        #10;
        if (pci_cbe_en_out !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule