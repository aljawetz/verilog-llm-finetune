`timescale 1ns/1ps

module tb_pci_mas_ad_en_crit;

    // Inputs
    reg ad_en_slow_in;
    reg ad_en_on_grant_in;
    reg pci_gnt_in;

    // Outputs
    wire pci_ad_en_out;

    // Instantiate the Unit Under Test (UUT)
    pci_mas_ad_en_crit uut (
        .pci_ad_en_out(pci_ad_en_out),
        .ad_en_slow_in(ad_en_slow_in),
        .ad_en_on_grant_in(ad_en_on_grant_in),
        .pci_gnt_in(pci_gnt_in)
    );

    initial begin
        // Initialize Inputs
        ad_en_slow_in = 0;
        ad_en_on_grant_in = 0;
        pci_gnt_in = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: ad_en_slow_in = 1, expect pci_ad_en_out = 1
        ad_en_slow_in = 1;
        #10;
        if (pci_ad_en_out !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: ad_en_slow_in = 0, ad_en_on_grant_in = 1, pci_gnt_in = 0, expect pci_ad_en_out = 1
        ad_en_slow_in = 0;
        ad_en_on_grant_in = 1;
        pci_gnt_in = 0;
        #10;
        if (pci_ad_en_out !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: ad_en_slow_in = 0, ad_en_on_grant_in = 1, pci_gnt_in = 1, expect pci_ad_en_out = 0
        pci_gnt_in = 1;
        #10;
        if (pci_ad_en_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: ad_en_slow_in = 0, ad_en_on_grant_in = 0, pci_gnt_in = 0, expect pci_ad_en_out = 0
        ad_en_on_grant_in = 0;
        #10;
        if (pci_ad_en_out !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: ad_en_slow_in = 0, ad_en_on_grant_in = 0, pci_gnt_in = 1, expect pci_ad_en_out = 0
        pci_gnt_in = 1;
        #10;
        if (pci_ad_en_out !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule