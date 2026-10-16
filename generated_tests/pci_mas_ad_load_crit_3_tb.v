`timescale 1ns/1ps

module tb_pci_mas_ad_load_crit;

    // Inputs
    reg ad_load_in;
    reg ad_load_on_grant_in;
    reg pci_gnt_in;

    // Outputs
    wire ad_load_out;

    // Instantiate the Unit Under Test (UUT)
    pci_mas_ad_load_crit uut (
        .ad_load_out(ad_load_out),
        .ad_load_in(ad_load_in),
        .ad_load_on_grant_in(ad_load_on_grant_in),
        .pci_gnt_in(pci_gnt_in)
    );

    initial begin
        // Test case 1: ad_load_in = 0, ad_load_on_grant_in = 0, pci_gnt_in = 0
        ad_load_in = 0; ad_load_on_grant_in = 0; pci_gnt_in = 0;
        #10;
        if (ad_load_out !== 0) $display("FAIL: Test case 1 failed, expected 0, got %b", ad_load_out);

        // Test case 2: ad_load_in = 0, ad_load_on_grant_in = 1, pci_gnt_in = 0
        ad_load_in = 0; ad_load_on_grant_in = 1; pci_gnt_in = 0;
        #10;
        if (ad_load_out !== 1) $display("FAIL: Test case 2 failed, expected 1, got %b", ad_load_out);

        // Test case 3: ad_load_in = 0, ad_load_on_grant_in = 1, pci_gnt_in = 1
        ad_load_in = 0; ad_load_on_grant_in = 1; pci_gnt_in = 1;
        #10;
        if (ad_load_out !== 0) $display("FAIL: Test case 3 failed, expected 0, got %b", ad_load_out);

        // Test case 4: ad_load_in = 1, ad_load_on_grant_in = 0, pci_gnt_in = 0
        ad_load_in = 1; ad_load_on_grant_in = 0; pci_gnt_in = 0;
        #10;
        if (ad_load_out !== 1) $display("FAIL: Test case 4 failed, expected 1, got %b", ad_load_out);

        // Test case 5: ad_load_in = 1, ad_load_on_grant_in = 1, pci_gnt_in = 0
        ad_load_in = 1; ad_load_on_grant_in = 1; pci_gnt_in = 0;
        #10;
        if (ad_load_out !== 1) $display("FAIL: Test case 5 failed, expected 1, got %b", ad_load_out);

        // Test case 6: ad_load_in = 1, ad_load_on_grant_in = 1, pci_gnt_in = 1
        ad_load_in = 1; ad_load_on_grant_in = 1; pci_gnt_in = 1;
        #10;
        if (ad_load_out !== 1) $display("FAIL: Test case 6 failed, expected 1, got %b", ad_load_out);

        // Test case 7: ad_load_in = 0, ad_load_on_grant_in = 0, pci_gnt_in = 1
        ad_load_in = 0; ad_load_on_grant_in = 0; pci_gnt_in = 1;
        #10;
        if (ad_load_out !== 0) $display("FAIL: Test case 7 failed, expected 0, got %b", ad_load_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule