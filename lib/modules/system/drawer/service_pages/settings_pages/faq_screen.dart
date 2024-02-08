import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_well/core/models/faq_dto.dart';
import '../../../../../core/blocs/faq/faq_bloc.dart';
import '../../../../../core/components/common_button.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/helper/navigateable.dart';
import '../../../../../core/providers/authorization/authorization_provider.dart';
import '../../../../../core/routes/routes.dart';

class FAQScreen extends StatefulWidget implements Navigateable {
  @override
  String getName() {
    return Routes.faq_screen;
  }

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.k_border_secondary_color,
      appBar: AppBar(
        title: Text('FAQ'),
        titleTextStyle: TextStyle(
            color: Styles.k_black_color,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        backgroundColor: Styles.k_white_color,
        toolbarHeight: height * 7.1,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Styles.k_border_primary_color,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 4.1, vertical: height * 1.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider(
                create: (_) => FAQBloc(
                    RepositoryProvider.of<AuthorizationProvider>(context))
                  ..add(GetFaqEvent()),
                child: BlocBuilder<FAQBloc, FaqState>(
                  builder: (context, state) {
                    if (state is FaqStateInitial) {
                      return _buildLoading();
                    } else if (state is FaqStateLoading) {
                      return _buildLoading();
                    } else if (state is FaqStateLoaded) {
                      List<FAQsDto> faq_dto = state.faq_dto;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: faq_dto.length,
                        itemBuilder: (_, index) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: expandedCard(context, faq_dto[index]),
                          );
                        },
                      );
                    } else if (state is FaqStateError) {
                      return Container();
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              CommonButton(
                child: Text('Сохранить'),
                onPressed: () {},
                //margin: EdgeInsets.symmetric(vertical: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => Container(child: CircularProgressIndicator());

  Widget expandedCard(BuildContext context, FAQsDto? faQsDto) => Container(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 100 * 1.9),
        decoration: BoxDecoration(
            color: Styles.k_white_color,
            borderRadius: BorderRadius.circular(16)),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              '${faQsDto!.title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            iconColor: Styles.k_main_color,
            collapsedIconColor: Styles.k_black_color,
            childrenPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 100 * 1.42),
            children: <Widget>[
              ListTile(
                title: Text(
                  '${faQsDto.description}',
                  style: TextStyle(
                      color: Styles.k_black_color,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
        ),
      );
}
