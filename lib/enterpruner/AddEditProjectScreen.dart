import 'package:flutter/material.dart';
class AddEditProjectScreen extends StatefulWidget {
  final String? projectId; // If null, it’s Add mode; otherwise, Edit mode
  final Map<String, dynamic>? projectData; // Existing project data for Edit mode

  const AddEditProjectScreen({Key? key, this.projectId, this.projectData}) : super(key: key);

  @override
  _AddEditProjectScreenState createState() => _AddEditProjectScreenState();
}

class _AddEditProjectScreenState extends State<AddEditProjectScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String name = '';
  String description = '';
  String industry = '';
  double fundingAmount = 0.0;
  double equityOffered = 0.0;

  @override
  void initState() {
    super.initState();

    // Load data in Edit mode
    if (widget.projectData != null) {
      name = widget.projectData!['name'] ?? '';
      description = widget.projectData!['description'] ?? '';
      industry = widget.projectData!['industry'] ?? '';
      fundingAmount = widget.projectData!['fundingAmount'] ?? 0.0;
      equityOffered = widget.projectData!['equityOffered'] ?? 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectId == null ? "Add Project" : "Edit Project"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Project Name
                TextFormField(
                  initialValue: name,
                  decoration: InputDecoration(labelText: "Project Name"),
                  validator: (value) => value!.isEmpty ? "Enter project name" : null,
                  onSaved: (value) => name = value!,
                ),
                SizedBox(height: 20),

                // Project Description
                TextFormField(
                  initialValue: description,
                  decoration: InputDecoration(labelText: "Project Description"),
                  maxLines: 3,
                  validator: (value) => value!.isEmpty ? "Enter project description" : null,
                  onSaved: (value) => description = value!,
                ),
                SizedBox(height: 20),

                // Industry
                TextFormField(
                  initialValue: industry,
                  decoration: InputDecoration(labelText: "Industry"),
                  validator: (value) => value!.isEmpty ? "Enter industry" : null,
                  onSaved: (value) => industry = value!,
                ),
                SizedBox(height: 20),

                // Funding Amount
                TextFormField(
                  initialValue: fundingAmount > 0 ? fundingAmount.toString() : null,
                  decoration: InputDecoration(labelText: "Funding Amount (USD)"),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? "Enter funding amount" : null,
                  onSaved: (value) => fundingAmount = double.tryParse(value!) ?? 0.0,
                ),
                SizedBox(height: 20),

                // Equity Offered
                TextFormField(
                  initialValue: equityOffered > 0 ? equityOffered.toString() : null,
                  decoration: InputDecoration(labelText: "Equity Offered (%)"),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? "Enter equity offered" : null,
                  onSaved: (value) => equityOffered = double.tryParse(value!) ?? 0.0,
                ),
                SizedBox(height: 20),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(widget.projectId == null
                            ? "Project Added Successfully"
                            : "Project Updated Successfully"),
                      ));
                      Navigator.pop(context);
                    }
                  },
                  child: Text(widget.projectId == null ? "Add Project" : "Save Changes"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}