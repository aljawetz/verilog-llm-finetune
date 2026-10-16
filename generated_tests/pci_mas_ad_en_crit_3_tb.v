`timescale 1ns/1ps

module tb_pci_mas_ad_en_crit;

    // Inputs
    reg ad_en_slow_in;
    reg ad_en_on_grant_in;
    reg pci_gnt_in;

    // Output
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

        // Test Case 1: ad_en_slow_in is high
        ad_en_slow_in = 1;
        #10;
        if (pci_ad_en_out !== 1) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: ad_en_on_grant_in is high and pci_gnt_in is low
        ad_en_slow_in = 0;
        ad_en_on_grant_in = 1;
        pci_gnt_in = 0;
        #10;
        if (pci_ad_en_out !== 1) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: ad_en_on_grant_in is high and pci_gnt_in is high
        ad_en_slow_in = 0;
        ad_en_on_grant_in = 1;
        pci_gnt_in = 1;
        #10;
        if (pci_ad_en_out !== 0) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: Both inputs are low
        ad_en_slow_in = 0;
        ad_en_on_grant_in = 0;
        pci_gnt_in = 0;
        #10;
        if (pci_ad_en_out !== 0) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        // Test Case 5: ad_en_slow_in is low, ad_en_on_grant_in is high, pci_gnt_in is low
        ad_en_slow_in = 0;
        ad_en_on_grant_in = 1;
        pci_gnt_in = 0;
        #10;
        if (pci_ad_en_out !== 1) begin
            $display("FAIL: Test Case 5 failed");
            $finish;
        end

        // Test Case 6: ad_en_slow_in is low, ad_en_on_grant_in is high, pci_gnt_in is high
        ad_en_slow_in = 0;
        ad_en_on_grant_in = 1;
        pci_gnt_in = 1;
        #10;
        if (pci_ad_en_out !== 0) begin
            $display("FAIL: Test Case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule