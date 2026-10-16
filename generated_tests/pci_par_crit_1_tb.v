`timescale 1ns/1ps

module tb_pci_par_crit;

    reg par_out_in;
    reg pci_cbe_en_in;
    reg data_par_in;
    reg [3:0] pci_cbe_in;
    wire par_out;

    // Instantiate the module under test (uut)
    pci_par_crit uut (
        .par_out(par_out),
        .par_out_in(par_out_in),
        .pci_cbe_en_in(pci_cbe_en_in),
        .data_par_in(data_par_in),
        .pci_cbe_in(pci_cbe_in)
    );

    initial begin
        // Initialize inputs
        par_out_in = 0;
        pci_cbe_en_in = 0;
        data_par_in = 0;
        pci_cbe_in = 4'b0000;

        // Test case 1: Check when pci_cbe_en_in is low
        pci_cbe_in = 4'b1010; // 1 ^ 0 ^ 1 ^ 0 = 0
        data_par_in = 0;
        #10;
        if (par_out !== 0) begin
            $display("FAIL: Test case 1 failed, expected par_out = 0, got %b", par_out);
            $finish;
        end

        // Test case 2: Check when pci_cbe_en_in is low with data_par_in = 1
        data_par_in = 1;
        #10;
        if (par_out !== 1) begin
            $display("FAIL: Test case 2 failed, expected par_out = 1, got %b", par_out);
            $finish;
        end

        // Test case 3: Check when pci_cbe_en_in is high
        pci_cbe_en_in = 1;
        par_out_in = 1; // par_out should follow par_out_in
        #10;
        if (par_out !== 1) begin
            $display("FAIL: Test case 3 failed, expected par_out = 1, got %b", par_out);
            $finish;
        end

        // Test case 4: Check when pci_cbe_en_in is high with par_out_in = 0
        par_out_in = 0;
        #10;
        if (par_out !== 0) begin
            $display("FAIL: Test case 4 failed, expected par_out = 0, got %b", par_out);
            $finish;
        end

        // Test case 5: Check with different pci_cbe_in values
        pci_cbe_en_in = 0;
        pci_cbe_in = 4'b1111; // 1 ^ 1 ^ 1 ^ 1 = 0
        data_par_in = 0;
        #10;
        if (par_out !== 0) begin
            $display("FAIL: Test case 5 failed, expected par_out = 0, got %b", par_out);
            $finish;
        end

        pci_cbe_in = 4'b1100; // 1 ^ 1 ^ 0 ^ 0 = 0
        data_par_in = 1;
        #10;
        if (par_out !== 1) begin
            $display("FAIL: Test case 6 failed, expected par_out = 1, got %b", par_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule