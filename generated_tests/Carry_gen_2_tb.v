`timescale 1ns/1ps

module tb_Carry_gen;
    parameter data_width = 4;
    reg [(data_width-1):0] a, b;
    reg cin;
    wire cout;

    // Instantiate the module under test (uut)
    Carry_gen #(.data_width(data_width)) uut (
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout)
    );

    initial begin
        // Test case 1: Basic carry generation
        a = 4'b0001; b = 4'b0001; cin = 0; #10;
        if (cout !== 0) $display("FAIL: Test case 1 failed, expected cout = 0, got cout = %b", cout);

        // Test case 2: Carry with cin
        a = 4'b0001; b = 4'b0001; cin = 1; #10;
        if (cout !== 1) $display("FAIL: Test case 2 failed, expected cout = 1, got cout = %b", cout);

        // Test case 3: No carry
        a = 4'b0010; b = 4'b0001; cin = 0; #10;
        if (cout !== 0) $display("FAIL: Test case 3 failed, expected cout = 0, got cout = %b", cout);

        // Test case 4: Generate carry
        a = 4'b0110; b = 4'b0111; cin = 0; #10;
        if (cout !== 1) $display("FAIL: Test case 4 failed, expected cout = 1, got cout = %b", cout);

        // Test case 5: Multiple bits with carry
        a = 4'b1111; b = 4'b1111; cin = 1; #10;
        if (cout !== 1) $display("FAIL: Test case 5 failed, expected cout = 1, got cout = %b", cout);

        // Test case 6: No carry with all zeros
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        if (cout !== 0) $display("FAIL: Test case 6 failed, expected cout = 0, got cout = %b", cout);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule