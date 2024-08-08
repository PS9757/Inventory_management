import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:task/presentation/home/bloc/search_data_cubit.dart';
import 'package:task/presentation/home/widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    context.read<SearchDataCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/BG.png'),
              fit: BoxFit.cover,
            ),
          ),
        )),
        Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          drawer: const Drawer(),
          body: Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    controller: _tabController,
                    padding: EdgeInsets.only(
                      top: size.width * 0.01,
                      bottom: size.width * 0.01,
                      left: size.width * 0.02,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    tabs: const [
                      Tab(
                        child: SizedBox(
                          width: 150,
                          child: Center(
                            child: Text(
                              'Details',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 2,
                    child: TabBarView(controller: _tabController, children: [
                      Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            width: size.width * 0.4,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(108, 108, 108, 0.25),
                                borderRadius: BorderRadius.circular(30)),
                            child:
                                BlocBuilder<SearchDataCubit, SearchDataState>(
                              builder: (context, state) {
                                return TypeAheadField(
                                  controller: searchController,
                                  builder: (context, controller, focusNode) {
                                    return TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      autofocus: true,
                                      cursorColor: Colors.white,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: Colors.black,
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'Search',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                    );
                                  },

                                  emptyBuilder: (context) {
                                    return Container(
                                      height: size.height * 0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Center(
                                        child: Text(
                                          'No Search Found',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(index.toString()),
                                    );
                                  },
                                  onSelected: (value) {
                                    searchController.text = value ?? '';
                                    context
                                        .read<SearchDataCubit>()
                                        .setSelectedData(value ?? '');
                                  },
                                  suggestionsCallback: (pattern) async {
                                    return await context.read<SearchDataCubit>().getSelectedData(pattern);
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          BlocBuilder<SearchDataCubit, SearchDataState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Barcode No.',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .barcode
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Location',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .location
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Branch',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .branch
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Status',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .status
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Counter',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .counter
                                                            .toString()
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Source',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .source
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Category',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .category
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Collection',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .collection
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.31,
                                                height: size.height * 0.05,
                                                labelText: 'Description',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .description
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Metal Grp',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .metalGrp
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'STK Section',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .stkSection
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Mfgd By',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .mfgdBy
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.31,
                                                height: size.height * 0.05,
                                                labelText: 'Notes',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state
                                                            .selectedData!.notes
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'In STK Since',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .inStkSince
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Cert No.',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .certNo
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'HUID No.',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .huidNo
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Order No.',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .orderNo
                                                            .toString()
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                              CustomTextfield(
                                                width: size.width * 0.15,
                                                height: size.height * 0.05,
                                                labelText: 'Cus Name',
                                                initialValue:
                                                    state.selectedData != null
                                                        ? state.selectedData!
                                                            .cusName
                                                        : '',
                                                margin: EdgeInsets.all(
                                                    size.width * 0.005),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: Container(
                                          height: size.height * 0.25,
                                          width: size.width * 0.15,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: state.selectedData != null
                                              ? Image.network(
                                                  state.selectedData!
                                                          .imageLink ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                )
                                              : const Center(
                                                  child: Text('No Image'),
                                                ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Size',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.size
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Quality',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.quality
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'KT',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.kt.toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Pcs',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.pcs.toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Gross Wt',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.grossWt
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Net Wt',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.netWt
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Dia Pcs',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.diaPcs
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Dia Wt',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.diaWt
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Cls Pcs',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.clsPcs
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Cls Wt',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.clsWt
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'Chain Wt',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.chainWt
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'M Rate',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.mRate
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'M Value',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.mValue
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'L Rate',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.lRate
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'L Charges',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.lCharges
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'R Charges',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.rCharges
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'O Charges',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.oCharges
                                                .toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                      CustomTextfield(
                                        width: size.width * 0.15,
                                        height: size.height * 0.05,
                                        labelText: 'MRP',
                                        initialValue: state.selectedData != null
                                            ? state.selectedData!.mrp.toString()
                                            : '',
                                        margin:
                                            EdgeInsets.all(size.width * 0.005),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: size.height * 0.3,
                              child:
                                  BlocBuilder<SearchDataCubit, SearchDataState>(
                                builder: (context, state) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: DataTable(
                                      columnSpacing: 70,
                                      headingRowColor:
                                          MaterialStatePropertyAll<Color>(
                                              Colors.white.withOpacity(0.4)),
                                      dataRowColor:
                                          MaterialStatePropertyAll<Color>(
                                              Colors.white.withOpacity(0.2)),
                                      columns: const [
                                        DataColumn(
                                            label: Text(
                                          'LOT Description',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                        DataColumn(
                                            label: Text('Group',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        DataColumn(
                                            label: Text('Units',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        DataColumn(
                                            label: Text('Pcs',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        DataColumn(
                                            label: Text('Weight',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        DataColumn(
                                            label: Text('Rate',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        DataColumn(
                                            label: Text('Value',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        DataColumn(
                                            label: Text('S Rate',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                        DataColumn(
                                            label: Text('S Value',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ],
                                      rows: state.selectedData != null
                                          ? state.selectedData!.tableEntity!
                                              .map((tableData) {
                                              return state.selectedData!
                                                          .tableEntity! ==
                                                      []
                                                  ? const DataRow(cells: [])
                                                  : DataRow(cells: [
                                                      DataCell(Text(
                                                          tableData
                                                                  .lotDescription ??
                                                              '',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                      DataCell(Text(
                                                          tableData.group ?? '',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                      DataCell(Text(
                                                          tableData.units ?? '',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                      DataCell(Text(
                                                          tableData.pcs
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                      DataCell(Text(
                                                          tableData.weight
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                      DataCell(Text(
                                                          tableData.rate
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                      DataCell(Text(
                                                          tableData.value
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                      DataCell(Text(
                                                          tableData.sRate
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                      DataCell(Text(
                                                          tableData.sValue
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                    ]);
                                            }).toList()
                                          : const [],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
