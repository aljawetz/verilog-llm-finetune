`timescale 1ns/1ps

module tb_pci_serr_en_crit;

    reg non_critical_par_in;
    reg pci_par_in;
    reg serr_generate_in;
    wire serr_en_out;

    // Instantiate the module under test (uut)
    pci_serr_en_crit uut (
        .serr_en_out(serr_en_out),
        .non_critical_par_in(non_critical_par_in),
        .pci_par_in(pci_par_in),
        .serr_generate_in(serr_generate_in)
    );

    initial begin
        // Test case 1: serr_generate_in = 0, should result in serr_en_out = 0
        serr_generate_in = 0; non_critical_par_in = 0; pci_par_in = 0;
        #10;
        if (serr_en_out !== 0) $display("FAIL: Test case 1 failed, expected 0, got %b", serr_en_out);

        // Test case 2: serr_generate_in = 1, non_critical_par_in = 0, pci_par_in = 0, should result in serr_en_out = 0
        serr_generate_in = 1; non_critical_par_in = 0; pci_par_in = 0;
        #10;
        if (serr_en_out !== 0) $display("FAIL: Test case 2 failed, expected 0, got %b", serr_en_out);

        // Test case 3: serr_generate_in = 1, non_critical_par_in = 0, pci_par_in = 1, should result in serr_en_out = 1
        serr_generate_in = 1; non_critical_par_in = 0; pci_par_in = 1;
        #10;
        if (serr_en_out !== 1) $display("FAIL: Test case 3 failed, expected 1, got %b", serr_en_out);

        // Test case 4: serr_generate_in = 1, non_critical_par_in = 1, pci_par_in = 0, should result in serr_en_out = 1
        serr_generate_in = 1; non_critical_par_in = 1; pci_par_in = 0;
        #10;
        if (serr_en_out !== 1) $display("FAIL: Test case 4 failed, expected 1, got %b", serr_en_out);

        // Test case 5: serr_generate_in = 1, non_critical_par_in = 1, pci_par_in = 1, should result in serr_en_out = 0
        serr_generate_in = 1; non_critical_par_in = 1; pci_par_in = 1;
        #10;
        if (serr_en_out !== 0) $display("FAIL: Test case 5 failed, expected 0, got %b", serr_en_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule